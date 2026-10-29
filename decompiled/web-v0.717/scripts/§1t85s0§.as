package
{
   public class §1t85s0§
   {
      
      public var nodeID:int;
      
      public var teleportNodeID:int;
      
      public var teleportPosX:int;
      
      public var action:int;
      
      public var title:String;
      
      public var stitle:String;
      
      public var failtext:String;
      
      public var auto:int;
      
      public var ap:int;
      
      public var stagedesign:int;
      
      public var bg:int = -1;
      
      public var time:int;
      
      public var stagewidth:int;
      
      public var condition:XMLList;
      
      private var reward:§1t77s0§;
      
      public var §1t1110s0§:XMLList = null;
      
      public var wave:Vector.<§1t116s0§>;
      
      public var intro:Vector.<§1t80s0§>;
      
      public var ending:Vector.<§1t80s0§>;
      
      public function §1t85s0§(param1:XML)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.nodeID = param1.node;
         if(param1.teleportnode.toString() != "")
         {
            this.teleportNodeID = param1.teleportnode;
         }
         else
         {
            this.teleportNodeID = this.nodeID;
         }
         this.action = param1.action;
         if(param1.teleportposx.toString() != "")
         {
            this.teleportPosX = param1.teleportposx;
         }
         else
         {
            this.teleportPosX = 150;
         }
         if(param1.title.toString() != "")
         {
            this.title = §1t1521s0§.§1t9287s0§(param1.title);
         }
         else
         {
            this.title = "";
         }
         if(param1.stitle.toString() != "")
         {
            this.stitle = §1t1521s0§.§1t9287s0§(param1.stitle);
         }
         else
         {
            this.stitle = this.title;
         }
         if(param1.failtext.toString() == "")
         {
            this.failtext = §1t1521s0§.§1t9287s0§(param1.failtext);
         }
         else
         {
            this.failtext = "";
         }
         if(param1.auto.toString() == "")
         {
            this.auto = 0;
         }
         else
         {
            this.auto = param1.auto;
         }
         if(param1.ap.toString() == "")
         {
            this.ap = 0;
         }
         else
         {
            this.ap = param1.ap;
         }
         if(param1.stagedesign.toString() == "")
         {
            this.stagedesign = 0;
         }
         else
         {
            this.stagedesign = param1.stagedesign;
         }
         if(param1.bg.toString() != "")
         {
            this.bg = param1.bg;
         }
         this.time = param1.time;
         var _loc2_:int = param1.wave.length();
         this.wave = new Vector.<§1t116s0§>();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.wave.push(new §1t116s0§(XML(param1.wave[_loc3_]).copy()));
            _loc3_++;
         }
         this.condition = XMLList(param1.condition).copy();
         this.reward = new §1t77s0§(param1.reward);
         this.intro = this.§1t1403s0§(XMLList(param1.intro).copy());
         this.ending = this.§1t1403s0§(XMLList(param1.ending).copy());
         if(param1.stagewidth.toString() == "")
         {
            this.stagewidth = 1000;
         }
         else
         {
            this.stagewidth = param1.stagewidth;
         }
         if(param1.roomobj.toString() != "")
         {
            this.§1t1110s0§ = XMLList(param1.roomobj).copy();
         }
      }
      
      public function §1t1111s0§() : XMLList
      {
         return this.§1t1110s0§;
      }
      
      public function §1t1402s0§() : int
      {
         if(this.§1t1110s0§ == null)
         {
            return 0;
         }
         return this.§1t1110s0§.room;
      }
      
      public function §1t1403s0§(param1:XMLList) : Vector.<§1t80s0§>
      {
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc7_:§1t3642s0§ = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Vector.<§1t80s0§> = new Vector.<§1t80s0§>();
         var _loc3_:int = param1.children().length();
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = param1.children()[_loc6_];
            _loc5_ = _loc4_.name();
            switch(_loc5_)
            {
               case "label":
                  _loc2_.push(new §1t3657s0§(this.§1t796s0§(_loc4_)));
                  break;
               case "goto":
                  _loc2_.push(new §1t3645s0§(this.§1t796s0§(_loc4_)));
                  break;
               case "text":
                  _loc2_.push(new §1t3658s0§(_loc4_));
                  break;
               case "dialogue":
                  _loc2_.push(new §1t3653s0§(_loc4_));
                  break;
               case "img":
                  _loc2_.push(new §1t3656s0§(this.§1t796s0§(_loc4_)));
                  break;
               case "imageurl":
                  _loc2_.push(new §1t3655s0§(this.§1t796s0§(_loc4_)));
                  break;
               case "option":
                  _loc7_ = new §1t3642s0§(_loc4_);
                  _loc2_.push(_loc7_);
                  _loc8_ = int(_loc7_.choice.length);
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     _loc2_.push(null);
                     _loc9_++;
                  }
                  break;
               case "choice":
                  break;
               case "outcome":
                  _loc2_.push(new §1t3637s0§(_loc4_));
                  break;
               case "cutscene":
                  _loc2_.push(new §1t3646s0§(_loc4_));
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function hasIntro() : Boolean
      {
         return this.intro.length > 0;
      }
      
      public function hasEnding() : Boolean
      {
         return this.ending.length > 0;
      }
      
      internal function §1t796s0§(param1:String) : String
      {
         return param1.substr(0,1) + param1.substr(1);
      }
      
      public function §1t992s0§() : §1t77s0§
      {
         return this.reward;
      }
      
      public function §1t1260s0§(param1:§1t77s0§) : *
      {
         this.reward = param1;
      }
   }
}

