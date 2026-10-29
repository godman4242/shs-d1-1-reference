package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1184")]
   public class BigmapRoom extends MovieClip
   {
      
      public var exit_s:BigmapExit;
      
      public var exit_e:BigmapExit;
      
      public var exit_w:BigmapExit;
      
      public var nodeIcon:MovieClip;
      
      public var exit_n:BigmapExit;
      
      internal var exitList:Array = new Array();
      
      internal var exits:Array;
      
      public function BigmapRoom()
      {
         super();
         this.exitList[0] = this.exit_n;
         this.exitList[1] = this.exit_s;
         this.exitList[2] = this.exit_e;
         this.exitList[3] = this.exit_w;
      }
      
      public function initNodeExits(exits:Array) : *
      {
         this.exits = exits;
         this.exitList[0].gotoAndStop(exits[0] + 1);
         this.exitList[1].gotoAndStop(exits[1] + 1);
         this.exitList[2].gotoAndStop(exits[2] + 1);
         this.exitList[3].gotoAndStop(exits[3] + 1);
      }
      
      internal function initExits() : *
      {
         for(var i:int = 0; i < this.exitList.length; i++)
         {
            if(i >= 4)
            {
               removeChild(this.exitList[i]);
            }
            else
            {
               this.exitList[i].gotoAndStop(1);
            }
         }
         this.exitList.splice(4,this.exitList.length - 4);
      }
      
      public function initIcon(iconType:int) : *
      {
         if(iconType == NodeGenerator.ICON_TOWN)
         {
            this.nodeIcon.gotoAndStop("town");
         }
         else if(iconType == NodeGenerator.ICON_CAVE || iconType == NodeGenerator.ICON_ONIDEN)
         {
            this.nodeIcon.gotoAndStop("cave");
         }
         else if(iconType == NodeGenerator.ICON_DUNGEON)
         {
            this.nodeIcon.gotoAndStop("dungeon");
         }
         else if(iconType == NodeGenerator.ICON_MINE)
         {
            this.nodeIcon.gotoAndStop("mine");
         }
         else if(iconType == NodeGenerator.ICON_DOJO)
         {
            this.nodeIcon.gotoAndStop("dojo");
         }
         else
         {
            this.nodeIcon.gotoAndStop("nothing");
         }
         if(StatsManager.consoleEnabled)
         {
            if(iconType == NodeGenerator.ICON_CAVE)
            {
               this.nodeIcon.gotoAndStop("cave");
            }
            else if(iconType == NodeGenerator.ICON_DUNGEON)
            {
               this.nodeIcon.gotoAndStop("dungeon");
            }
            else if(iconType == NodeGenerator.ICON_MINE)
            {
               this.nodeIcon.gotoAndStop("mine");
            }
            else if(iconType == NodeGenerator.ICON_FORT)
            {
               this.nodeIcon.gotoAndStop("fort");
            }
            else if(iconType == NodeGenerator.ICON_EXIT)
            {
               this.nodeIcon.gotoAndStop("exit");
            }
            else if(iconType == NodeGenerator.ICON_CONTROL)
            {
               this.nodeIcon.gotoAndStop("control");
            }
            else if(iconType == NodeGenerator.ICON_PICKABLE)
            {
               this.nodeIcon.gotoAndStop("pickable");
            }
            else if(iconType == NodeGenerator.ICON_DOJO)
            {
               this.nodeIcon.gotoAndStop("dojo");
            }
            else if(iconType == NodeGenerator.ICON_TEMPLE)
            {
               this.nodeIcon.gotoAndStop("temple");
            }
            else if(iconType == NodeGenerator.ICON_HUT)
            {
               this.nodeIcon.gotoAndStop("hut");
            }
            else if(iconType == NodeGenerator.ICON_GRAVEYARD)
            {
               this.nodeIcon.gotoAndStop("graveyard");
            }
            else if(iconType == NodeGenerator.ICON_ONIDEN)
            {
               this.nodeIcon.gotoAndStop("oniden");
            }
            else if(iconType == NodeGenerator.ICON_MERCCAMP)
            {
               this.nodeIcon.gotoAndStop("merccamp");
            }
            else if(iconType == NodeGenerator.ICON_ANIMALSPAWN)
            {
               this.nodeIcon.gotoAndStop("animalspawn");
            }
            else if(iconType == NodeGenerator.ICON_NINJAVILLAGE)
            {
               this.nodeIcon.gotoAndStop("ninjavillage");
            }
            else if(iconType == NodeGenerator.ICON_NINJATRAIL)
            {
               this.nodeIcon.gotoAndStop("ninjatrail");
            }
            else if(iconType == NodeGenerator.ICON_BEACH)
            {
               this.nodeIcon.gotoAndStop("beach");
            }
            else if(iconType == NodeGenerator.ICON_OVERWRITENODE)
            {
               this.nodeIcon.gotoAndStop("overwritenode");
            }
         }
      }
   }
}

