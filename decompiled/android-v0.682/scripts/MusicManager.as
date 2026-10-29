package
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class MusicManager
   {
      
      public static var instance:MusicManager;
      
      public static var MUSIC_NONE:int = 0;
      
      public static var MUSIC_EXPLOREBATTLE:int = 1;
      
      public static var MUSIC_TOUGHBATTLE:int = 2;
      
      public static var MUSIC_QUIET:int = 3;
      
      public static var MUSIC_EXPLORESAFE:int = 4;
      
      public static var MUSIC_EXPLOREDANGER:int = 5;
      
      public static var MUSIC_EXPLORETOWN:int = 6;
      
      public static var MUSIC_DUNGEONBATTLE:int = 7;
      
      public static var MUSIC_PVP:int = 8;
      
      public static var MUSIC_DUNGEON:int = 9;
      
      public static var MUSIC_DUNGEONCREEPY:int = 11;
      
      public static var MUSIC_DUNGEONCREEPYDANGER:int = 12;
      
      public static var MUSIC_DOJO:int = 14;
      
      public static var MUSIC_BATTLEDRUMS:int = 15;
      
      public static var MUSIC_DUNGEONDANGER:int = 16;
      
      public static var MUSIC_GANGNAM:int = 100;
      
      public static var MUSIC_LEVELUP:int = 101;
      
      public static var MUSIC_LOSE:int = 102;
      
      public static var loaded:Boolean = false;
      
      internal var TRACK_BATTLECHANTS:int = 0;
      
      internal var TRACK_BATTLEDRUMS:int = 1;
      
      internal var TRACK_FLUTES:int = 2;
      
      internal var TRACK_SAFEAMBIENCE:int = 3;
      
      internal var TRACK_SAFEKOTO:int = 4;
      
      internal var TRACK_SAFEPERCUSSION:int = 5;
      
      internal var TRACK_DUNGEONAMBIENCE:int = 6;
      
      internal var TRACK_DUNGEONFLUTE:int = 7;
      
      internal var TRACK_DUNGEONPERCUSSION:int = 8;
      
      internal var TRACK_DUNGEONPIANO:int = 9;
      
      internal var TRACK_GANGNAM:int = 10;
      
      internal var TRACK_LEVELUP:int = 11;
      
      internal var TRACK_LOSE:int = 12;
      
      internal var TOTALTRACKS:int = 13;
      
      internal var ACTION_NONE:int = 0;
      
      internal var ACTION_FADEOUT:int = 1;
      
      internal var ACTION_FADEIN:int = 2;
      
      internal var hasAction:Boolean = false;
      
      internal var trackArray:Array = new Array();
      
      internal var scArray:Array = new Array();
      
      internal var actionArray:Array = new Array();
      
      internal var presetsArray:Array = new Array();
      
      internal var soundCompleteFunctionArray:Array = new Array();
      
      internal var currentPreset:Array;
      
      public function MusicManager()
      {
         super();
         instance = this;
      }
      
      public static function getInstance() : MusicManager
      {
         if(instance == null)
         {
            new MusicManager();
         }
         return instance;
      }
      
      public function init() : *
      {
         this.trackArray[this.TRACK_BATTLECHANTS] = ResourceManager.getMusic("battlechants");
         this.trackArray[this.TRACK_BATTLEDRUMS] = ResourceManager.getMusic("battledrums");
         this.trackArray[this.TRACK_FLUTES] = ResourceManager.getMusic("flutes");
         this.trackArray[this.TRACK_SAFEAMBIENCE] = ResourceManager.getMusic("safeambience");
         this.trackArray[this.TRACK_SAFEKOTO] = ResourceManager.getMusic("safekoto");
         this.trackArray[this.TRACK_SAFEPERCUSSION] = ResourceManager.getMusic("safepercussion");
         this.trackArray[this.TRACK_DUNGEONAMBIENCE] = ResourceManager.getMusic("dungeonambience");
         this.trackArray[this.TRACK_DUNGEONFLUTE] = ResourceManager.getMusic("dungeonflute");
         this.trackArray[this.TRACK_DUNGEONPERCUSSION] = ResourceManager.getMusic("dungeonpercussion");
         this.trackArray[this.TRACK_DUNGEONPIANO] = ResourceManager.getMusic("dungeonpiano");
         this.trackArray[this.TRACK_GANGNAM] = ResourceManager.getMusic("bgm_gangnam");
         this.trackArray[this.TRACK_LEVELUP] = ResourceManager.getMusic("bgm_levelup");
         this.trackArray[this.TRACK_LOSE] = ResourceManager.getMusic("bgm_lose");
         for(var i:int = 0; i < this.TOTALTRACKS; i++)
         {
            this.scArray[i] = null;
            this.actionArray[i] = this.ACTION_NONE;
         }
         this.presetsArray[MUSIC_NONE] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_EXPLOREBATTLE] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_EXPLOREBATTLE][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_EXPLOREBATTLE][this.TRACK_BATTLEDRUMS] = true;
         this.presetsArray[MUSIC_TOUGHBATTLE] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_TOUGHBATTLE][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_TOUGHBATTLE][this.TRACK_BATTLEDRUMS] = true;
         this.presetsArray[MUSIC_TOUGHBATTLE][this.TRACK_BATTLECHANTS] = true;
         this.presetsArray[MUSIC_QUIET] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_QUIET][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_EXPLORESAFE] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_EXPLORESAFE][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_EXPLORESAFE][this.TRACK_SAFEAMBIENCE] = true;
         this.presetsArray[MUSIC_EXPLOREDANGER] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_EXPLOREDANGER][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_EXPLOREDANGER][this.TRACK_SAFEAMBIENCE] = true;
         this.presetsArray[MUSIC_EXPLOREDANGER][this.TRACK_SAFEPERCUSSION] = true;
         this.presetsArray[MUSIC_EXPLORETOWN] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_EXPLORETOWN][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_EXPLORETOWN][this.TRACK_SAFEAMBIENCE] = true;
         this.presetsArray[MUSIC_EXPLORETOWN][this.TRACK_SAFEKOTO] = true;
         this.presetsArray[MUSIC_DUNGEONBATTLE] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_DUNGEONBATTLE][this.TRACK_BATTLEDRUMS] = true;
         this.presetsArray[MUSIC_DUNGEONBATTLE][this.TRACK_DUNGEONFLUTE] = true;
         this.presetsArray[MUSIC_PVP] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_PVP][this.TRACK_BATTLEDRUMS] = true;
         this.presetsArray[MUSIC_PVP][this.TRACK_BATTLECHANTS] = true;
         this.presetsArray[MUSIC_DUNGEON] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_DUNGEON][this.TRACK_DUNGEONAMBIENCE] = true;
         this.presetsArray[MUSIC_DUNGEON][this.TRACK_DUNGEONFLUTE] = true;
         this.presetsArray[MUSIC_DUNGEONCREEPY] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_DUNGEONCREEPY][this.TRACK_DUNGEONPIANO] = true;
         this.presetsArray[MUSIC_DUNGEONCREEPYDANGER] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_DUNGEONCREEPYDANGER][this.TRACK_DUNGEONAMBIENCE] = true;
         this.presetsArray[MUSIC_DUNGEONCREEPYDANGER][this.TRACK_DUNGEONFLUTE] = true;
         this.presetsArray[MUSIC_DUNGEONCREEPYDANGER][this.TRACK_DUNGEONPERCUSSION] = true;
         this.presetsArray[MUSIC_DUNGEONCREEPYDANGER][this.TRACK_DUNGEONPIANO] = true;
         this.presetsArray[MUSIC_DOJO] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_DOJO][this.TRACK_FLUTES] = true;
         this.presetsArray[MUSIC_DOJO][this.TRACK_SAFEAMBIENCE] = true;
         this.presetsArray[MUSIC_DOJO][this.TRACK_SAFEKOTO] = true;
         this.presetsArray[MUSIC_DOJO][this.TRACK_SAFEPERCUSSION] = true;
         this.presetsArray[MUSIC_BATTLEDRUMS] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_BATTLEDRUMS][this.TRACK_BATTLEDRUMS] = true;
         this.presetsArray[MUSIC_DUNGEONDANGER] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_DUNGEONDANGER][this.TRACK_DUNGEONAMBIENCE] = true;
         this.presetsArray[MUSIC_DUNGEONDANGER][this.TRACK_DUNGEONFLUTE] = true;
         this.presetsArray[MUSIC_DUNGEONDANGER][this.TRACK_DUNGEONPERCUSSION] = true;
         this.presetsArray[MUSIC_GANGNAM] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_GANGNAM][this.TRACK_GANGNAM] = true;
         this.presetsArray[MUSIC_LEVELUP] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_LEVELUP][this.TRACK_LEVELUP] = true;
         this.presetsArray[MUSIC_LOSE] = new Array(this.TOTALTRACKS);
         this.presetsArray[MUSIC_LOSE][this.TRACK_LOSE] = true;
         this.currentPreset = this.presetsArray[MUSIC_NONE];
         loaded = true;
         SoundManager.getInstance().continueMusic();
         trace("Music resource loaded");
      }
      
      public function playPreset(index:int) : *
      {
         var playPosition:int = 0;
         var sndTransform:SoundTransform = null;
         var oldPreset:Array = this.currentPreset;
         this.currentPreset = this.presetsArray[index];
         for(var i:int = 0; i < this.TOTALTRACKS; i++)
         {
            if(!oldPreset[i] && Boolean(this.currentPreset[i]))
            {
               playPosition = 0;
               if(this.scArray[this.TRACK_FLUTES] != null)
               {
                  playPosition = int(this.scArray[this.TRACK_FLUTES].position);
               }
               else if(this.scArray[this.TRACK_BATTLEDRUMS] != null)
               {
                  playPosition = int(this.scArray[this.TRACK_BATTLEDRUMS].position);
               }
               else if(this.scArray[this.TRACK_SAFEPERCUSSION] != null)
               {
                  playPosition = int(this.scArray[this.TRACK_SAFEPERCUSSION].position);
               }
               else if(this.scArray[this.TRACK_DUNGEONPIANO] != null)
               {
                  playPosition = int(this.scArray[this.TRACK_DUNGEONPIANO].position);
               }
               else if(this.scArray[this.TRACK_DUNGEONAMBIENCE] != null)
               {
                  playPosition = int(this.scArray[this.TRACK_DUNGEONAMBIENCE].position);
               }
               else if(this.scArray[this.TRACK_DUNGEONFLUTE] != null)
               {
                  playPosition = int(this.scArray[this.TRACK_DUNGEONFLUTE].position);
               }
               if(Boolean(oldPreset[this.TRACK_FLUTES]) && Boolean(this.currentPreset[this.TRACK_DUNGEONFLUTE]) || Boolean(oldPreset[this.TRACK_DUNGEONFLUTE]) && Boolean(this.currentPreset[this.TRACK_FLUTES]))
               {
                  playPosition = 0;
               }
               if(playPosition > this.trackArray[i].length)
               {
                  playPosition %= this.trackArray[i].length;
               }
               if(this.scArray[i] != null)
               {
                  this.scArray[i].stop();
                  this.scArray[i].removeEventListener(Event.SOUND_COMPLETE,this.soundCompleteFunctionArray[i]);
               }
               if(i == this.TRACK_LOSE)
               {
                  this.scArray[i] = this.trackArray[i].play(0,1);
                  this.actionArray[i] = this.ACTION_NONE;
               }
               else if(i == this.TRACK_LEVELUP)
               {
                  this.scArray[i] = this.trackArray[i].play(0,999);
                  this.actionArray[i] = this.ACTION_NONE;
               }
               else
               {
                  this.scArray[i] = this.trackArray[i].play(playPosition);
                  this.soundCompleteFunctionArray[i] = this.soundCompleteFunction(i);
                  this.scArray[i].addEventListener(Event.SOUND_COMPLETE,this.soundCompleteFunctionArray[i]);
                  if(this.scArray[i] != null)
                  {
                     sndTransform = this.scArray[i].soundTransform;
                     sndTransform.volume = 0;
                     this.scArray[i].soundTransform = sndTransform;
                     this.actionArray[i] = this.ACTION_FADEIN;
                     this.hasAction = true;
                  }
               }
            }
            else if(Boolean(oldPreset[i]) && !this.currentPreset[i])
            {
               this.actionArray[i] = this.ACTION_FADEOUT;
               this.hasAction = true;
            }
         }
      }
      
      internal function soundCompleteFunction(index:int) : Function
      {
         return function(event:Event):void
         {
            SoundChannel(event.target).removeEventListener(Event.SOUND_COMPLETE,soundCompleteFunctionArray[index]);
            scArray[index] = trackArray[index].play();
            scArray[index].addEventListener(Event.SOUND_COMPLETE,soundCompleteFunctionArray[index]);
         };
      }
      
      public function update() : *
      {
         var sndTransform:SoundTransform = null;
         var noActionCount:int = 0;
         var sc:SoundChannel = null;
         var i:int = 0;
         if(this.hasAction)
         {
            noActionCount = 0;
            for(i = 0; i < this.TOTALTRACKS; i++)
            {
               if(this.actionArray[i] == this.ACTION_FADEOUT)
               {
                  sc = this.scArray[i];
                  if(sc != null)
                  {
                     sndTransform = sc.soundTransform;
                     sndTransform.volume -= 0.05;
                     if(sndTransform.volume <= 0)
                     {
                        sc.stop();
                        if(this.soundCompleteFunctionArray[i] != null)
                        {
                           sc.removeEventListener(Event.SOUND_COMPLETE,this.soundCompleteFunctionArray[i]);
                        }
                        this.soundCompleteFunctionArray[i] = null;
                        this.scArray[i] = null;
                        this.actionArray[i] = this.ACTION_NONE;
                     }
                     else
                     {
                        this.scArray[i].soundTransform = sndTransform;
                     }
                  }
                  else
                  {
                     this.actionArray[i] = this.ACTION_NONE;
                  }
               }
               else if(this.actionArray[i] == this.ACTION_FADEIN)
               {
                  sc = this.scArray[i];
                  if(sc != null)
                  {
                     sndTransform = sc.soundTransform;
                     sndTransform.volume += 0.05;
                     if(sndTransform.volume >= 1)
                     {
                        this.actionArray[i] = this.ACTION_NONE;
                     }
                     sc.soundTransform = sndTransform;
                  }
                  else
                  {
                     this.actionArray[i] = this.ACTION_NONE;
                  }
               }
               else
               {
                  noActionCount++;
               }
            }
            if(noActionCount == this.TOTALTRACKS)
            {
               this.hasAction = false;
            }
         }
      }
   }
}

