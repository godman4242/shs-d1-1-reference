package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2354")]
   public class Obj_PickableItemProcGen extends InteractiveStageObject
   {
      
      public var primary:MovieClip;
      
      internal var itemname:String = "";
      
      internal var itemtype:int;
      
      internal var color:uint;
      
      internal var descindex:int;
      
      public function Obj_PickableItemProcGen(props:String, objName:String)
      {
         var dice:int = 0;
         var typename:String = null;
         super();
         this.props = props;
         var strArray:Array = props.split(",");
         var rng:RNG = new RNG(int(strArray[0]));
         if(strArray.length == 2)
         {
            dice = int(strArray[1]);
         }
         else
         {
            dice = rng.rand(3);
         }
         gotoAndStop(dice + 1);
         if(dice == 0)
         {
            typename = LangManager.getString(443);
            this.itemtype = 2122;
         }
         else if(dice == 1)
         {
            typename = LangManager.getString(444);
            this.itemtype = 2123;
         }
         else if(dice == 2)
         {
            typename = LangManager.getString(445);
            this.itemtype = 2124;
         }
         else if(dice == 3)
         {
            typename = LangManager.getString(4071);
            this.itemtype = 2148;
            rng = new RNG(int(strArray[0]) * QueryManager.instance.getServerDate());
         }
         var colorindex:int = rng.rand(11);
         var colorhexlist:Array = [16711680,16737792,16763904,39168,13311,6684927,16751103,6697728,16777215,10066329,0];
         this.color = colorhexlist[colorindex];
         ColorCode.changeColor(this.primary,this.color);
         this.descindex = rng.rand(ItemGenerator.instance.pickableQuestItemDescListLength);
         this.itemname = ItemGenerator.instance.getProcGenQuestItemName(this.itemtype,this.descindex);
         objectName = objName;
         scaleX = Math.random() * 0.3 + 0.9;
         scaleY = Math.random() * 0.3 + 0.9;
         rotation = Math.random() * 5 - 10;
         if(int(Math.random()) * 2 == 0)
         {
            scaleX = -scaleX;
         }
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         var data:XMLQuestStep = null;
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
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
            return;
         }
         var item:Item = new Item(this.itemtype);
         item.setPrimaryColor(this.color);
         item.addModifier(85,this.descindex);
         if(this.itemtype == 2122)
         {
            StatsManager.reportAchievementStat(60012,1);
         }
         else if(this.itemtype == 2123)
         {
            StatsManager.reportAchievementStat(60013,1);
         }
         else if(this.itemtype == 2124)
         {
            StatsManager.reportAchievementStat(60014,1);
         }
         StatsManager.addItemToInventory(item);
         QueryManager.instance.reportDataModified(StatsManager.QUESTITEM);
         QuestGenerator.instance.checkSetReturnMarkedNode();
         QueryManager.instance.saveModifiedCharData();
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,iconID);
            shown = true;
         }
         else if(!flag && shown)
         {
            shown = false;
         }
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(431) + this.itemname;
      }
      
      override public function getAPUse() : int
      {
         return 1;
      }
   }
}

