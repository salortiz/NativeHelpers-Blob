#include <stdio.h>
#include <stdint.h>

#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

typedef struct point3d_t {
    int64_t x;
    int64_t y;
    int64_t z;
} Point3D;

DLLEXPORT char *myaddr(Point3D *points) {
    static char buff[20];
    sprintf(buff, "%p", points);
    return buff;
}

DLLEXPORT char *shown(Point3D *arr, int idx) {
    static char buff[100];
    sprintf(buff, "x:%d, y:%d, z:%d", arr[idx].x, arr[idx].y, arr[idx].z);
    return buff;
}
