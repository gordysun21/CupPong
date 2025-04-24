// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace
// @input SceneObject previewObject
// @input Component.HandTracking handTracking

var INDEX_TIP = 8; // Joint index for index finger tip in HandTracking

function updatePreview() {
    // Get world position of the index finger tip
    var indexTip = script.handTracking.getJointPosition(INDEX_TIP);

    if (!indexTip) {
        script.previewObject.enabled = false;
        return;
    }

    // Project a ray from camera toward the index tip direction
    var camPos = global.scene.getCameraTransform().getWorldPosition();
    var dir = indexTip.sub(camPos).normalize();

    var rayStart = camPos;
    var rayEnd = rayStart.add(dir.uniformScale(10)); // arbitrary far point

    // Convert world-space ray to screen-space points
    var screenRayStart = global.scene.viewport.worldToScreenSpace(rayStart);
    var screenRayEnd = global.scene.viewport.worldToScreenSpace(rayEnd);

    // Midpoint between start and end
    var screenMid = screenRayStart.add(screenRayEnd).uniformScale(0.5);

    var hits = script.deviceTracking.hitTestWorldMesh(screenMid);

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
