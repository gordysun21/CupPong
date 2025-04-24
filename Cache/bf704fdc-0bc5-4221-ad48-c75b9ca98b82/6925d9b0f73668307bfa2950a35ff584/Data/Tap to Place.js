// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace
// @input SceneObject previewObject

var HandTracking = require("HandTracking");

function showPreviewAt(screenPos) {
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
        print("DEBUG: Preview placed at " + point.toString());
    } else {
        script.previewObject.enabled = false;
        print("DEBUG: No hit detected for preview");
    }
}

function onTap(eventData) {
    print("DEBUG: Tap triggered");
    var screenPos = eventData.getTapPosition();
    showPreviewAt(screenPos); // Preview follows tap

    // Final placement happens here too
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

script.createEvent("TapEvent").bind(onTap);
print("DEBUG: Tap-to-place script loaded");
