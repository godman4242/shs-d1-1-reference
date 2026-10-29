package
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class SoundManager
   {
      
      public static var instance:SoundManager;
      
      public var isPlaying:* = true;
      
      public var sc:SoundChannel;
      
      public var bgmusic1:Sound = new music1();
      
      public var playSounds:* = true;
      
      public function SoundManager()
      {
         super();
         instance = this;
         sc = bgmusic1.play(0,999);
      }
      
      public function stopMusic() : *
      {
         if(isPlaying)
         {
            sc.stop();
            isPlaying = false;
         }
      }
      
      public function playMusic() : *
      {
         if(!isPlaying)
         {
            sc = bgmusic1.play(0,999);
            isPlaying = true;
         }
      }
      
      public function playSlash() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Sound = null;
         if(!playSounds)
         {
            return;
         }
         _loc1_ = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = new sword1();
            _loc2_.play();
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = new sword2();
            _loc2_.play();
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = new sword3();
            _loc2_.play();
         }
      }
      
      public function playDie() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Sound = null;
         if(!playSounds)
         {
            return;
         }
         _loc1_ = Math.random() * 3;
         if(_loc1_ == 0)
         {
            _loc2_ = new hit1();
            _loc2_.play();
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = new hit2();
            _loc2_.play();
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = new hit3();
            _loc2_.play();
         }
      }
      
      public function playPunch() : *
      {
         var _loc1_:Sound = null;
         if(!playSounds)
         {
            return;
         }
         _loc1_ = new punch();
         _loc1_.play();
      }
      
      public function playScarecrowDie() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Sound = null;
         if(!playSounds)
         {
            return;
         }
         _loc1_ = Math.random() * 2;
         if(_loc1_ == 0)
         {
            _loc2_ = new hit1();
            _loc2_.play();
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = new hit2();
            _loc2_.play();
         }
      }
      
      public function playCrash() : *
      {
         var _loc1_:Sound = null;
         if(!playSounds)
         {
            return;
         }
         _loc1_ = new crash();
         _loc1_.play();
      }
      
      public function playBossDie() : *
      {
         var _loc1_:Sound = null;
         if(!playSounds)
         {
            return;
         }
         _loc1_ = new bossdie();
         _loc1_.play();
      }
   }
}

