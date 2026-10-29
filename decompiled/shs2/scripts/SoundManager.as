package
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class SoundManager
   {
      
      public static var instance:SoundManager;
      
      internal var bossfight:Sound;
      
      internal var area2:Sound;
      
      internal var area3:Sound;
      
      internal var area4:Sound;
      
      public var canPlaySounds:* = true;
      
      public var sc:SoundChannel;
      
      internal var notPlaying:int = -1;
      
      public var canPlayMusic:* = true;
      
      public var isPlaying:int = -1;
      
      internal var cutscene4:Sound;
      
      internal var endingcutscene:Sound;
      
      internal var powerambient:Sound;
      
      public function SoundManager()
      {
         super();
         instance = this;
         area2 = new area2_mp3();
         area3 = new area3_mp3();
         area4 = new area4_mp3();
         bossfight = new boss_fight_mp3();
         cutscene4 = new cutscene4_mp3();
         endingcutscene = new ending_cutscene_mp3();
         powerambient = new power_mp3();
      }
      
      public function powerOn() : *
      {
         notPlaying = isPlaying;
         playMusic(10);
      }
      
      public function playBoss4Hurt() : *
      {
         var _loc1_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = new hitmetal();
         _loc1_.play();
      }
      
      public function playToBeContinued() : *
      {
         var _loc1_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = new die2();
         _loc1_.play();
      }
      
      public function playMusic(param1:int) : *
      {
         if(!canPlayMusic)
         {
            notPlaying = param1;
            return;
         }
         if(isPlaying == param1)
         {
            return;
         }
         if(isPlaying != -1)
         {
            stopMusic();
         }
         switch(param1)
         {
            case 3:
               sc = area2.play(0,999);
               isPlaying = 3;
               break;
            case 4:
               sc = area3.play(0,999);
               isPlaying = 4;
               break;
            case 5:
               sc = area4.play(0,999);
               isPlaying = 5;
               break;
            case 7:
               sc = bossfight.play(0,999);
               isPlaying = 7;
               break;
            case 8:
               sc = cutscene4.play(0,999);
               isPlaying = 8;
               break;
            case 9:
               sc = endingcutscene.play(0,999);
               isPlaying = 9;
               break;
            case 10:
               sc = powerambient.play(0,999);
               isPlaying = 10;
         }
      }
      
      public function stopMusic() : *
      {
         if(isPlaying != -1)
         {
            sc.stop();
            isPlaying = -1;
         }
      }
      
      public function muteMusic() : *
      {
         if(!canPlayMusic || isPlaying == 10)
         {
            return;
         }
         notPlaying = isPlaying;
         stopMusic();
      }
      
      public function playSlash() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = new slash1();
            _loc2_.play();
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = new slash2();
            _loc2_.play();
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = new slash3();
            _loc2_.play();
         }
      }
      
      public function playDie() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = new die1();
            _loc2_.play();
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = new die2();
            _loc2_.play();
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = new die3();
            _loc2_.play();
         }
      }
      
      public function playBoss1Hurt() : *
      {
         var _loc1_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = new die2();
         _loc1_.play();
         _loc1_ = new punch();
         _loc1_.play();
      }
      
      public function playHitMetal() : *
      {
         var _loc1_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = new hitmetal();
         _loc1_.play();
      }
      
      public function playHit() : *
      {
         var _loc1_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = new punch();
         _loc1_.play();
      }
      
      public function powerOff() : *
      {
         if(canPlayMusic)
         {
            continueMusic();
         }
      }
      
      public function playDeflect() : *
      {
         var _loc1_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = new deflect();
         _loc1_.play();
      }
      
      public function continueMusic() : *
      {
         if(isPlaying == -1 || isPlaying == 10)
         {
            playMusic(notPlaying);
         }
      }
      
      public function playBoom() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Sound = null;
         if(!canPlaySounds)
         {
            return;
         }
         _loc1_ = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = new boom1();
            _loc2_.play();
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = new boom2();
            _loc2_.play();
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = new boom3();
            _loc2_.play();
         }
      }
   }
}

