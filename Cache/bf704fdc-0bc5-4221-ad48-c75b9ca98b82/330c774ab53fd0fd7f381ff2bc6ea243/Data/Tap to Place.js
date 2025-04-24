// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace
// @input SceneObject previewObject

function updatePreview() {
    // Get current mouse/cursor position in normalized screen space
    var screenPos = global.getCursorPosition(); // returns vec2(0–1, 0–1)

    var hits = script.deviceTracking.hitTestWorldMesh(screenPos);
    if (hits.length > 0) {
        var point = hits[0].position;
        var normal = hits[0].normal;

        script.previewObject.getTransform().setWorldPosition(point);

        var up = vec3.up();
        var forwardDir = up.projectOnPlane(normal).normalize();
        var rot = quat.lookAt(forwardDir, normal);
        script.previewObject.getTransform().setWorldRotation(rot);

        script.previewObject.enabled = true;
    } else {
        script.previewObject.enabled = false;
    }
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
