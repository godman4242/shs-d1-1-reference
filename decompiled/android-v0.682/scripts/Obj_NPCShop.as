package
{
   import flash.display.MovieClip;
   
   public class Obj_NPCShop extends InteractiveStageObject
   {
      
      internal var mcs:MCSCharacter;
      
      internal var npcname:String;
      
      internal var shopName:String;
      
      public function Obj_NPCShop(props:String, objname:String = "")
      {
         super();
         if(props == "")
         {
            props = "1";
            trace("<property> missing in Obj_NPC " + objname);
         }
         this.props = props;
         var strArray:Array = props.split(",");
         var npcid:int = int(strArray[0]);
         this.mcs = QuestEngine.getNPCMCS(npcid);
         if(strArray.length < 2)
         {
            this.mcs.startAnim(MCSActor.IDLE2);
         }
         else
         {
            this.mcs.startAnim(strArray[1]);
         }
         if(strArray.length >= 3 && strArray[2] == "1")
         {
            this.mcs.faceRight();
         }
         else
         {
            this.mcs.faceLeft();
         }
         addChild(this.mcs);
         this.npcname = QuestEngine.getNPCName(npcid);
         if(objname == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = objname;
         }
         this.mcs.setDisplayName(this.npcname);
         iconID = NodeUI.ACTION_SHOP;
         this.shopName = LangManager.getString(QuestEngine.getShopData(Overworld.currentNode).name);
      }
      
      override public function interact() : *
      {
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_PEDDLER);
      }
      
      override public function getDisplayText() : String
      {
         return this.shopName;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 100;
      }
   }
}

