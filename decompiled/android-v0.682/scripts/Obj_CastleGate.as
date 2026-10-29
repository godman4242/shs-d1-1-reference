package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2523")]
   public class Obj_CastleGate extends InteractiveStageObject
   {
      
      public var hotspot:RedBG;
      
      internal var dest:int;
      
      internal var destpos:int;
      
      internal var side:int;
      
      internal var opened:Boolean = false;
      
      internal var destName:String;
      
      public function Obj_CastleGate(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(objname == "")
         {
            objectName = "castlegate";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.dest = int(strArray[0]);
         this.destpos = int(strArray[1]);
         this.side = int(strArray[2]);
         this.hotspot.alpha = 0;
         this.hotspot.buttonMode = true;
         this.destName = StageManager.getRoomName(this.dest,-1);
         this.closeGates();
         var territoryId:int = NodeGenerator.instance.getTerritoryId(StageManager.getCurrentNode());
         QueryManagerPIO.instance.getCastleGateOpened(territoryId,this.callback);
      }
      
      public function callback(time:int) : *
      {
         if(QueryManager.instance.getServerTime() - time > 3 * 60 * 60)
         {
            this.closeGates();
         }
         else
         {
            this.openGates();
         }
      }
      
      internal function openGates() : *
      {
         this.opened = true;
         iconID = NodeUI.ACTION_TRAVEL;
         gotoAndStop(2);
      }
      
      internal function closeGates() : *
      {
         this.opened = false;
         if(this.side == StatsManager.getSide())
         {
            iconID = NodeUI.ACTION_TRAVEL;
         }
         else
         {
            iconID = NodeUI.ACTION_LOOK;
         }
         gotoAndStop(1);
      }
      
      override public function needTransition() : Boolean
      {
         return this.opened || this.side == StatsManager.getSide();
      }
      
      override public function interactClick() : *
      {
         if(this.needTransition())
         {
            OverworldHUD.getInstance().screenTransition.setParam(this);
            OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(677),LangManager.getString(5));
         }
      }
      
      override public function interact() : *
      {
         if(this.needTransition())
         {
            StageManager.gotoRoom(this.dest,this.destpos);
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(677),LangManager.getString(5));
         }
      }
      
      override public function getDisplayText() : String
      {
         if(this.needTransition())
         {
            return LangManager.getString(141) + " " + this.destName;
         }
         return LangManager.getString(770);
      }
      
      override public function doScroll(dist:int) : *
      {
         x += dist / 3;
      }
      
      override public function isMouseOver(mouseX:int, mouseY:int) : Boolean
      {
         return this.hotspot.hitTestPoint(mouseX,mouseY);
      }
      
      override public function hasHotSpot() : Boolean
      {
         return true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

