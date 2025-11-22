#include "Engine/Application.h"

bool app_init(Application* app, const ApplicationConfig* config)
{
    app->isRunning = true;

    return true;
}

void app_run(Application* app)
{
    while(app->isRunning)
    {
        app_update(app);
        app_render(app);
    }
}

void app_update(Application* app)
{

}

void app_render(Application* app)
{

}

void app_shutdown(Application* app)
{
    
}