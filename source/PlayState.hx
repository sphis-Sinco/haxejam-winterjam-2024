package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var bg:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.CYAN);

	var player:FlxSprite = new FlxSprite(0, 0).loadGraphic('assets/images/fish.png', true, 64, 64);

	override public function create()
	{
		FlxG.camera.fade(FlxColor.BLACK, 3.25, true);
		add(bg);

		player.animation.add('idle', [0]);
		player.animation.add('eat', [1, 1, 2, 2, 2, 3, 3, 0], 24, false);
		player.animation.play('idle');
		player.screenCenter();
		add(player);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (player.animation.finished && player.animation.name != 'idle')
			player.animation.play('idle');

		if (FlxG.keys.justReleased.SPACE)
		{
			player.animation.play('eat');
			FlxG.sound.play("assets/sounds/fish.wav", 1, false, null, true);
		}

		super.update(elapsed);
	}
}
