package
{
   import flash.media.Sound;
   
   public class SoundManager
   {
      
      public static var instance:SoundManager;
      
      public var isPlaying:int = -1;
      
      public var hasSound:* = true;
      
      public var hasMusic:* = true;
      
      internal var notPlaying:int = -1;
      
      internal var musicManager:MusicManager;
      
      internal var loaded:Boolean = false;
      
      public function SoundManager()
      {
         super();
         instance = this;
         this.musicManager = MusicManager.getInstance();
      }
      
      public static function getInstance() : SoundManager
      {
         if(instance == null)
         {
            new SoundManager();
         }
         return instance;
      }
      
      public function init() : *
      {
         this.loaded = true;
         trace("Sound resource loaded");
      }
      
      public function toggleMusic() : *
      {
         if(this.hasMusic)
         {
            this.muteMusic();
         }
         this.hasMusic = !this.hasMusic;
         if(this.hasMusic)
         {
            this.continueMusic();
         }
         QueryManager.instance.saveOptions();
         if(Boolean(this.hasMusic) && !MusicManager.loaded)
         {
            ResourceManager.loadMusicResource();
         }
      }
      
      public function toggleSound() : *
      {
         this.hasSound = !this.hasSound;
         QueryManager.instance.saveOptions();
         if(Boolean(this.hasSound) && !this.loaded)
         {
            ResourceManager.loadSoundResource();
         }
      }
      
      public function playMusic(num:int) : *
      {
         if(!this.hasMusic || !MusicManager.loaded)
         {
            this.notPlaying = num;
            return;
         }
         if(this.isPlaying == num)
         {
            return;
         }
         this.musicManager.playPreset(num);
         this.isPlaying = num;
      }
      
      public function stopMusic() : *
      {
         if(this.isPlaying != -1)
         {
            this.musicManager.playPreset(MusicManager.MUSIC_NONE);
            this.isPlaying = -1;
         }
      }
      
      public function continueMusic() : *
      {
         if(this.isPlaying == -1)
         {
            this.playMusic(this.notPlaying);
         }
      }
      
      public function muteMusic() : *
      {
         if(!this.hasMusic)
         {
            return;
         }
         this.notPlaying = this.isPlaying;
         this.stopMusic();
      }
      
      public function pickMusic(bg:int, isHostile:Boolean, isPvP:Boolean) : *
      {
         if(isPvP)
         {
            this.playMusic(MusicManager.MUSIC_PVP);
         }
         else if(bg == GameStage.BG_DUNGEON || bg == GameStage.BG_CAVE || bg == GameStage.BG_CAVELAKE || bg == GameStage.BG_CAVELAVA || bg == GameStage.BG_MINE || bg == GameStage.BG_JINMAKU_NIGHT || bg == GameStage.BG_ANCIENTRUINS)
         {
            if(isHostile)
            {
               this.playMusic(MusicManager.MUSIC_DUNGEONDANGER);
            }
            else
            {
               this.playMusic(MusicManager.MUSIC_DUNGEON);
            }
         }
         else if(bg == GameStage.BG_TOWNPROCGEN_VILLAGE || bg == GameStage.BG_TOWNPROCGEN_TOWN || bg == GameStage.BG_TOWNPROCGEN_CITY || bg == GameStage.BG_INN || bg == GameStage.BG_KITCHEN || bg == GameStage.BG_GAMBLINGDEN || bg == GameStage.BG_TEMPLEINTERIOR || bg == GameStage.BG_HUTINSIDE)
         {
            this.playMusic(MusicManager.MUSIC_EXPLORETOWN);
         }
         else if(bg == GameStage.BG_DOJO || bg == GameStage.BG_DOJO2)
         {
            this.playMusic(MusicManager.MUSIC_DOJO);
         }
         else if(bg == GameStage.BG_DESTROYEDVILLAGE || bg == GameStage.BG_JINMAKU_OUTSIDE || bg == GameStage.BG_JINMAKU)
         {
            this.playMusic(MusicManager.MUSIC_EXPLOREDANGER);
         }
         else if(bg == GameStage.BG_GRAVEYARD || bg == GameStage.BG_FORESTSPOOKY || bg == GameStage.BG_TEMPLERUINS_FOG || bg == GameStage.BG_TEMPLEEXTERIOR_FOG || bg == GameStage.BG_DUNGEON_FOG)
         {
            if(isHostile)
            {
               this.playMusic(MusicManager.MUSIC_DUNGEONCREEPYDANGER);
            }
            else
            {
               this.playMusic(MusicManager.MUSIC_DUNGEONCREEPY);
            }
         }
         else if(bg == GameStage.BG_CASTLEHALLWAY || bg == GameStage.BG_CASTLEROOM || bg == GameStage.BG_CASTLEWALLS || bg == GameStage.BG_CASTLEWALLS_INNER || bg == GameStage.BG_DOJO3)
         {
            if(isHostile)
            {
               this.playMusic(MusicManager.MUSIC_EXPLOREDANGER);
            }
            else
            {
               this.playMusic(MusicManager.MUSIC_EXPLORETOWN);
            }
         }
         else if(isHostile)
         {
            this.playMusic(MusicManager.MUSIC_EXPLOREDANGER);
         }
         else
         {
            this.playMusic(MusicManager.MUSIC_EXPLORESAFE);
         }
      }
      
      public function pickBattleMusic() : *
      {
         if(this.isPlaying == MusicManager.MUSIC_EXPLOREDANGER)
         {
            this.playMusic(MusicManager.MUSIC_EXPLOREBATTLE);
         }
         else if(this.isPlaying == MusicManager.MUSIC_DUNGEONDANGER || this.isPlaying == MusicManager.MUSIC_DUNGEONCREEPYDANGER)
         {
            this.playMusic(MusicManager.MUSIC_DUNGEONBATTLE);
         }
      }
      
      public function playSlash() : *
      {
         var sound:Sound = null;
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var dice:int = Math.random() * 3;
         if(dice == 0)
         {
            sound = ResourceManager.getSound("slash1");
            if(sound != null)
            {
               sound.play();
            }
         }
         else if(dice == 1)
         {
            sound = ResourceManager.getSound("slash2");
            if(sound != null)
            {
               sound.play();
            }
         }
         else if(dice == 2)
         {
            sound = ResourceManager.getSound("slash3");
            if(sound != null)
            {
               sound.play();
            }
         }
      }
      
      public function playDie() : *
      {
         var sound:Sound = null;
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var dice:int = Math.random() * 3;
         if(dice == 0)
         {
            sound = ResourceManager.getSound("die1");
            if(sound != null)
            {
               sound.play();
            }
         }
         else if(dice == 1)
         {
            sound = ResourceManager.getSound("die2");
            if(sound != null)
            {
               sound.play();
            }
         }
         else if(dice == 2)
         {
            sound = ResourceManager.getSound("die3");
            if(sound != null)
            {
               sound.play();
            }
         }
      }
      
      public function playHit() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("punch");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playHurt() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("punch");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playHitMetal() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("hitmetal");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playDeflect() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("deflect");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playFart() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("fart");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playGoodKoto() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("goodkoto");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playSumo() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("sumo");
         if(sound != null)
         {
            sound.play();
         }
      }
      
      public function playRefund() : *
      {
         if(!this.hasSound || !this.loaded)
         {
            return;
         }
         var sound:Sound = ResourceManager.getSound("refund");
         if(sound != null)
         {
            sound.play();
         }
      }
   }
}

