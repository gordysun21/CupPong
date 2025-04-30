// @input Component.DeviceTracking deviceTracking
// @input Component.Camera mainCamera
// @input SceneObject previewObject
// @input SceneObject objectToPlace

// Initially hide the object to place
script.objectToPlace.enabled = false;

// Track if object has been placed
var hasPlaced = false;

function getCenterHitOrFallback() {
    var center = new vec2(0.5, 0.5);
    var hits = script.deviceTracking.hitTestWorldMesh(center);
    if (hits.length > 0) { return hits[0]; }
    // fallback 1.5m out
    var camPos = script.mainCamera.getTransform().getWorldPosition();
    var forward = script.mainCamera.getTransform().forward.normalize();
    return {
        position: camPos.add(forward.uniformScale(1.5)),
        normal: vec3.up()
    };
}

function getFinalRotation() {
    var fwd = script.mainCamera.getTransform().forward;
    var flat = new vec3(fwd.x, 0, fwd.z).normalize().uniformScale(-1);
    return quat.lookAt(flat, vec3.up());
}

function updatePreview() {
    // Only show preview if we haven't placed yet
    if (!hasPlaced) {
        var hit = getCenterHitOrFallback();
        script.previewObject.getTransform().setWorldPosition(hit.position);
        script.previewObject.getTransform().setWorldRotation(getFinalRotation());
        script.previewObject.enabled = true;
    } else {
        // Hide preview after placement
        script.previewObject.enabled = false;
    }
}

function onPlace(eventData) {
    // Only place if we haven't already placed
    if (!hasPlaced) {
        var hit = getCenterHitOrFallback();
        var tr = script.objectToPlace.getTransform();
        tr.setWorldPosition(hit.position);
        tr.setWorldRotation(getFinalRotation());
        
        // Make the object visible
        script.objectToPlace.enabled = true;
        
        // Set the flag so we can't place again
        hasPlaced = true;
        
        print("Placed at " + hit.position.toString());
        
        // Hide preview immediately
        script.previewObject.enabled = false;
    }
}

// Update preview
script.createEvent("LateUpdateEvent").bind(updatePreview);

// For Spectacles, we need to use TouchEvent instead of TapEvent
// TouchEvent provides the eventData with screen position information
var touchEvent = script.createEvent("TouchEndEvent");
touchEvent.bind(onPlace);

// Optional: Disable the preview object when an object is placed
// Uncomment if you want this behavior
// function onPlaceAndHidePreview(eventData) {
//     onPlace(eventData);
//     script.previewObject.enabled = false;
// }
// touchEvent.bind(onPlaceAndHidePreview);