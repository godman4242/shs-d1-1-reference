package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2368")]
   public class Obj_PickableItem extends InteractiveStageObject
   {
      
      internal var itemtype:int;
      
      public function Obj_PickableItem(props:String, objName:String)
      {
         super();
         objectName = objName;
         if(props == "")
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(int(props));
         }
         this.itemtype = int(props);
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         if(!StatsManager.checkAP(1))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            return;
         }
         visible = false;
         canInteract = false;
         StatsManager.getPlayer().stopMoving(false);
         StatsManager.getPlayer().startAnim(MCSActor.PICKUP);
         StageManager.addToDeadList(objectName);
         if(this.itemtype == 20)
         {
            StatsManager.addKey();
            OverworldHUD.instance.minimap.clearCurrentRoomIcon();
            OverworldHUD.instance.updateHUD();
         }
         else if(this.itemtype == 30)
         {
            StatsManager.addToInventory(20007);
            QuestGenerator.instance.checkSetReturnMarkedNode();
            QueryManager.instance.saveModifiedCharData();
         }
      }
      
      override public function getDisplayText() : String
      {
         if(this.itemtype < 11)
         {
            return LangManager.getString(405);
         }
         if(this.itemtype == 20)
         {
            return LangManager.getString(424);
         }
         if(this.itemtype == 30)
         {
            return LangManager.getString(676);
         }
         return LangManager.getString(406);
      }
      
      override public function getAPUse() : int
      {
         return 1;
      }
   }
}

