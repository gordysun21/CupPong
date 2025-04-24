// @input Component.DeviceTracking deviceTracking
// @input Component.HandTracking handTracking
// @input Asset.ObjectPrefab objectPrefab
// @input SceneObject parent

var placed = false;

function onUpdate() {
    if (placed) return;

    var gesture = script.handTracking.getGestureType(0); // 0 = left hand
    if (gesture != HandGestureType.FINGER_PINCH) {
        return;
    }

    var screenCenter = new vec2(0.5, 0.5);
    var hits = script.deviceTracking.hitTestWorldMesh(screenCenter);

    if (hits.length > 0) {
        var point = hits[0].position;
        var normal = hits[0].normal;

        var up = vec3.up();
        var forwardDir = up.projectOnPlane(normal).normalize();
        var rot = quat.lookAt(forwardDir, normal);

        var obj = script.objectPrefab.instantiate(script.parent);
        obj.getTransform().setWorldPosition(point);
        obj.getTransform().setWorldRotation(rot);

        placed = true;
    }
}

script.createEvent("UpdateEvent").bind(onUpdate);
