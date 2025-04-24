// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace
// @input SceneObject previewObject

var INDEX_TIP = 8; // Index finger tip joint
var RIGHT_HAND = 1;

function updatePreview() {
    var joint = HandTracking.getJointPose(INDEX_TIP, RIGHT_HAND);

    if (!joint || !joint.worldPosition) {
        script.previewObject.enabled = false;
        return;
    }

    var fingerPos = joint.worldPosition;
    var camPos = global.scene.getCameraTransform().getWorldPosition();
    var dir = fingerPos.sub(camPos).normalize();

    var rayStart = camPos;
    var rayEnd = rayStart.add(dir.uniformScale(10));

    var screenRayStart = global.scene.viewport.worldToScreenSpace(rayStart);
    var screenRayEnd = global.scene.viewport.worldToScreenSpace(rayEnd);
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
