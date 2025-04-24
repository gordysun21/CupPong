// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace
// @input SceneObject previewObject

function updatePreview() {
    var screenPos = Input.getCursorPosition();

    if (!screenPos) {
        print("DEBUG: No cursor position detected");
        script.previewObject.enabled = false;
        return;
    }

    print("DEBUG: Cursor position = " + screenPos.toString());

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

        print("DEBUG: Preview positioned at " + point.toString());
    } else {
        print("DEBUG: No hit detected from cursor ray");
        script.previewObject.enabled = false;
    }
}

function onTap(eventData) {
    print("DEBUG: TapEvent triggered");

    var screenPos = eventData.getTapPosition();
    print("DEBUG: Tap position = " + screenPos.toString());

    var hits = script.deviceTracking.hitTestWorldMesh(screenPos);

    if (hits.length > 0) {
        var point = hits[0].position;
        var normal = hits[0].normal;

        script.objectToPlace.getTransform().setWorldPosition(point);

        var up = vec3.up();
        var forwardDir = up.projectOnPlane(normal).normalize();
        var rot = quat.lookAt(forwardDir, normal);
        script.objectToPlace.getTransform().setWorldRotation(rot);

        print("DEBUG: Object placed at " + point.toString());
    } else {
        print("DEBUG: No hit result from tap");
    }
}

// Bind update and tap events
script.createEvent("LateUpdateEvent").bind(updatePreview);
script.createEvent("TapEvent").bind(onTap);

print("DEBUG: Script loaded and events bound");
