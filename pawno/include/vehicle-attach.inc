#include <a_samp>

#if !defined IsValidVehicle
	native bool:IsValidVehicle(vehicleid);
#endif

new VehicleAttachedObject[MAX_VEHICLES];


SetVehicleAttachedObject(vehicleid, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    // Se já existir um objeto anterior, destruímos
    if (VehicleAttachedObject[vehicleid] != 0)
    {
        DestroyDynamicObject(VehicleAttachedObject[vehicleid]);
        VehicleAttachedObject[vehicleid] = 0;
    }

    // Criar e anexar novo objeto
    new objectid = CreateDynamicObject(modelid, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachDynamicObjectToVehicle(objectid, vehicleid, x, y, z, rx, ry, rz);

    // Guardar o ID
    VehicleAttachedObject[vehicleid] = objectid;
    return objectid;
}

RemoveVehicleAllAttachedObject(vehicleid)
{
    if (VehicleAttachedObject[vehicleid] != 0)
    {
        DestroyDynamicObject(VehicleAttachedObject[vehicleid]);
        VehicleAttachedObject[vehicleid] = 0;
        return 1;
    }
    return 0; 
}
