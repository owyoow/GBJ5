
import luxe.Camera.SizeMode;
import luxe.GameConfig;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

import phoenix.Texture;

class Main extends luxe.Game 
{
    private var design_width:Int = 160;
    private var design_height:Int = 144;

    var zoom:Float;

    override function config (config:GameConfig) 
    {

        config.window.title = 'GB Jam 5 Entry';
        config.window.width = 640;
        config.window.height = 576;
        config.window.fullscreen = false;

        config.preload.textures.push({ id: 'assets/images/background.png' });

        return config;

    } // config

    override function ready () 
    {
        // get the zoom factor for the screen size
        zoom = Math.floor(Luxe.screen.h / design_height);

        // get the new camera size
        var screen_w:Int = Math.floor(Luxe.screen.w / zoom);
        var screen_h:Int = Math.floor(Luxe.screen.h / zoom);

        // set the camera size
        Luxe.camera.size = new Vector(screen_w, screen_h);
        Luxe.camera.size_mode = SizeMode.fit;

        // load the image and set the image filter to nearest neighbor to help the pixel art
        var image:Texture = Luxe.resources.texture('assets/images/background.png');
        image.filter_min = image.filter_mag = FilterType.nearest;

        // add the sprite to the screen
        new Sprite({
            name: 'background',
            texture: image,
            size: new Vector(design_width, design_height),
            centered: false
        });
    } // ready

    override function onkeyup (event:KeyEvent) 
    {

        if (event.keycode == Key.escape)
        {
            Luxe.shutdown();
        }

    } // onkeyup

    override function update (delta:Float)
    {

    } // update

} // Main
