// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace
// @input SceneObject previewObject // <-- Transparent ghost object for preview

function updatePreview() {
    // You can use center of screen or any screen point for dynamic preview
    var screenPos = new vec2(0.5, 0.5); // center of screen
    var hits = script.deviceTracking.hitTestWorldMesh(screenPos);

    if (hits.length > 0) {
        var point = hits[0].position;
        var normal = hits[0].normal;

        // Update preview position
        script.previewObject.getTransform().setWorldPosition(point);

        // Orient preview to align with surface
        var up = vec3.up();
        var forwardDir = up.projectOnPlane(normal).normalize();
        var rot = quat.lookAt(forwardDir, normal);
        script.previewObject.getTransform().setWorldRotation(rot);
    } else {
        // Optionally hide preview if no hit
        script.previewObject.enabled = false;
        return;
    }

    // Show preview if hidden
    script.previewObject.enabled = true;
}

function onTap(eventData) {
    var screenPos = eventData.getTapPosition();
    var hits = script.deviceTracking.hitTestWorldMesh(screenPos);

    if (hits.length > 0) {
        var point = hits[0].position;
        var normal = hits[0].normal;

        script.objectToPlace.getTransform().setWorldPosition(point);

        var up = vec3.up();
        var forwardDir = up.projectOnPlane(normal).normalize();
        var rot = quat.lookAt(forwardDir, normal);
        script.objectToPlace.getTransform().setWorldRotation(rot);
    }
}

script.createEvent("LateUpdateEvent").bind(updatePreview);
script.createEvent("TapEvent").bind(onTap);
