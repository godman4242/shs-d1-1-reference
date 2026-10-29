package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1398")]
   public class GenericActionButton extends MovieClip
   {
      
      public var questSubText:TextField;
      
      public var normalText:TextField;
      
      public var greyout:MovieClip;
      
      public var buttonBG:SimpleButton;
      
      public var questMainText:TextField;
      
      public var apText:TextField;
      
      public var image:MovieClip;
      
      public var type:int;
      
      public var questID:int;
      
      public var stepID:int;
      
      public var actualHeight:int;
      
      public var buttonType:int;
      
      public var questType:int;
      
      public var interactiveObject:InteractiveStageObject;
      
      public var objectTriggersQuest:Boolean = false;
      
      public function GenericActionButton()
      {
         super();
         this.greyout.visible = false;
         LangManager.initTextField(this.normalText,true);
         this.normalText.mouseEnabled = false;
         LangManager.initTextField(this.questMainText,true);
         this.questMainText.mouseEnabled = false;
         LangManager.initTextField(this.questSubText);
         this.questSubText.mouseEnabled = false;
         LangManager.initTextField(this.apText);
         this.apText.mouseEnabled = false;
      }
      
      public function uninit() : *
      {
         if(this.image != null)
         {
            removeChild(this.image);
         }
         if(this.interactiveObject != null)
         {
            this.interactiveObject.setShown(false);
            this.interactiveObject = null;
         }
         this.image = null;
      }
      
      public function initAction(index:int, actionID:int) : *
      {
         this.type = index;
         this.buttonType = actionID;
         this.setImage();
      }
      
      public function initInteract(obj:InteractiveStageObject, iconID:int) : *
      {
         this.interactiveObject = obj;
         this.buttonType = NodeUI.ACTION_INTERACT;
         this.setText(obj.getDisplayText(),"",obj.getAPUse());
         this.normalText.x = 15;
         this.questMainText.x = 15;
         this.questSubText.x = 15;
         if(iconID != -1)
         {
            this.setInteractIcon(iconID);
         }
      }
      
      public function getInteractiveObject() : InteractiveStageObject
      {
         return this.interactiveObject;
      }
      
      public function setInteractiveObject(obj:InteractiveStageObject) : *
      {
         this.interactiveObject = obj;
      }
      
      public function initQuest(index:int, subText:String, mainText:String = "", qType:int = 0, id:int = 0, step:int = 0, ap:int = 0, objectTriggersQuest:Boolean = false) : *
      {
         this.buttonType = NodeUI.ACTION_QUEST;
         this.questType = qType;
         this.type = index;
         this.questID = id;
         this.stepID = step;
         this.objectTriggersQuest = objectTriggersQuest;
         this.actualHeight = SimpleButton(this.buttonBG).height;
         this.setImage();
         if(qType == QuestType.Dialogue)
         {
            subText = "";
         }
         this.setText(mainText,subText,ap);
      }
      
      public function initNetworkPlayer(charname:String, nid:String) : *
      {
         this.buttonType = NodeUI.ACTION_LOOKATNETWORKPLAYER;
         this.setText(LangManager.getString(201) + charname);
         this.questMainText.text = nid;
         this.questMainText.visible = false;
         this.setImage();
      }
      
      public function getNetworkPlayerNid() : String
      {
         return this.questMainText.text;
      }
      
      public function getButtonType() : int
      {
         return this.buttonType;
      }
      
      public function setImage() : void
      {
         switch(this.buttonType)
         {
            case NodeUI.ACTION_REST:
               this.image = new RestActionIcon();
               this.setText(LangManager.getString(93),"",1);
               break;
            case NodeUI.ACTION_SHOP:
               this.image = new ShopActionIcon();
               this.setText(LangManager.getString(94),"",0);
               break;
            case NodeUI.ACTION_TRAVEL:
               this.image = new TravelActionIcon();
               this.setText(LangManager.getString(95),"",5);
               break;
            case NodeUI.ACTION_FISH:
               this.image = new FishingActionIcon();
               this.setText(LangManager.getString(96),"",3);
               break;
            case NodeUI.ACTION_HUNT:
               this.image = new HuntingActionIcon();
               this.setText(LangManager.getString(97),"",3);
               break;
            case NodeUI.ACTION_SEARCH:
               this.image = new SearchActionIcon();
               this.setText(LangManager.getString(98),"",3);
               break;
            case NodeUI.ACTION_CAMP:
               this.image = new CampActionIcon();
               this.setText(LangManager.getString(99),"",5);
               break;
            case NodeUI.ACTION_TRAIN:
               this.image = new ShopActionIcon();
               this.setText(LangManager.getString(168),"",0);
               break;
            case NodeUI.ACTION_ENTER:
               this.image = new EnterActionIcon();
               this.setText(LangManager.getString(141),"",1);
               break;
            case NodeUI.ACTION_LOOKATNETWORKPLAYER:
               this.image = new LookActionIcon();
               break;
            case NodeUI.ACTION_ITEM:
               this.image = new ItemActionIcon();
               break;
            case NodeUI.ACTION_ADD:
               this.image = new AddActionIcon();
               break;
            case NodeUI.ACTION_MINUS:
               this.image = new MinusActionIcon();
               break;
            case NodeUI.ACTION_ATTACK:
               this.image = new AttackActionIcon();
               break;
            case NodeUI.ACTION_STEAL:
               this.image = new StealActionIcon();
               break;
            case NodeUI.ACTION_BACK:
               this.image = new BackActionIcon();
               break;
            case NodeUI.ACTION_FIREELEMENT:
               this.image = new FireElementActionIcon();
               break;
            case NodeUI.ACTION_WINDELEMENT:
               this.image = new WindElementActionIcon();
               break;
            case NodeUI.ACTION_WATERELEMENT:
               this.image = new WaterElementActionIcon();
               break;
            case NodeUI.ACTION_EARTHELEMENT:
               this.image = new EarthElementActionIcon();
               break;
            case NodeUI.ACTION_MINE:
               this.image = new MineActionIcon();
               break;
            case NodeUI.ACTION_GIFT:
               this.image = new GiftIcon();
               break;
            case NodeUI.ACTION_STORAGE:
               this.image = new StorageActionIcon();
               break;
            case NodeUI.ACTION_MEDAL:
               this.image = new MedalActionIcon();
               break;
            case NodeUI.ACTION_QUEST:
               switch(this.questType)
               {
                  case QuestType.StoryQuest:
                     this.image = new StoryQuestActionIcon();
                     break;
                  case QuestType.OngoingQuest:
                     this.image = new OngoingQuestActionIcon();
                     break;
                  case QuestType.Dialogue:
                     this.image = new TalkActionIcon();
                     break;
                  default:
                     if(this.questType < QuestType.length)
                     {
                        this.image = new NewQuestActionIcon(this.questType);
                     }
                     else
                     {
                        this.image = null;
                     }
               }
         }
         if(this.image)
         {
            this.image.x = 18;
            this.image.y = 20;
            addChild(this.image);
            this.image.mouseEnabled = false;
            this.normalText.x = 38;
            this.questMainText.x = 38;
            this.questSubText.x = 38;
         }
         else
         {
            this.normalText.x = 15;
            this.questMainText.x = 15;
            this.questSubText.x = 15;
         }
      }
      
      public function setInteractIcon(iconID:int) : *
      {
         if(this.image != null)
         {
            removeChild(this.image);
            this.image = null;
         }
         switch(iconID)
         {
            case NodeUI.ACTION_LEAVE:
               this.image = new LeaveActionIcon();
               break;
            case NodeUI.ACTION_LOOK:
               this.image = new LookActionIcon();
               break;
            case NodeUI.ACTION_SHOP:
            case NodeUI.ACTION_BUY:
            case NodeUI.ACTION_SELL:
               this.image = new ShopActionIcon();
               break;
            case NodeUI.ACTION_SEARCH:
               this.image = new SearchActionIcon();
               break;
            case NodeUI.ACTION_TALK:
               this.image = new TalkActionIcon();
               break;
            case NodeUI.ACTION_USE:
               this.image = new UseActionIcon();
               break;
            case NodeUI.ACTION_TRAVEL:
               this.image = new TravelActionIcon();
               break;
            case NodeUI.ACTION_REST:
               this.image = new RestActionIcon();
               break;
            case NodeUI.ACTION_ITEM:
               this.image = new ItemActionIcon();
               break;
            case NodeUI.ACTION_ADD:
               this.image = new AddActionIcon();
               break;
            case NodeUI.ACTION_MINUS:
               this.image = new MinusActionIcon();
               break;
            case NodeUI.ACTION_ATTACK:
               this.image = new AttackActionIcon();
               break;
            case NodeUI.ACTION_STEAL:
               this.image = new StealActionIcon();
               break;
            case NodeUI.ACTION_BACK:
               this.image = new BackActionIcon();
               break;
            case NodeUI.ACTION_FIREELEMENT:
               this.image = new FireElementActionIcon();
               break;
            case NodeUI.ACTION_WINDELEMENT:
               this.image = new WindElementActionIcon();
               break;
            case NodeUI.ACTION_WATERELEMENT:
               this.image = new WaterElementActionIcon();
               break;
            case NodeUI.ACTION_EARTHELEMENT:
               this.image = new EarthElementActionIcon();
               break;
            case NodeUI.ACTION_MINE:
               this.image = new MineActionIcon();
               break;
            case NodeUI.ACTION_GIFT:
               this.image = new GiftIcon();
               break;
            case NodeUI.ACTION_STORAGE:
               this.image = new StorageActionIcon();
               break;
            case NodeUI.ACTION_MEDAL:
               this.image = new MedalActionIcon();
               break;
            case NodeUI.ACTION_TRAIN:
               this.image = new ShopActionIcon();
         }
         this.image.x = 18;
         this.image.y = 20;
         addChild(this.image);
         this.image.mouseEnabled = false;
         this.normalText.x = 38;
         this.questMainText.x = 38;
         this.questSubText.x = 38;
      }
      
      public function clearIcon() : *
      {
         if(this.image != null)
         {
            removeChild(this.image);
            this.image = null;
         }
      }
      
      public function setText(mainTxt:String, subTxt:String = "", ap:int = 0) : *
      {
         if(subTxt == "")
         {
            this.normalText.text = mainTxt;
            this.normalText.visible = true;
            this.questMainText.visible = false;
            this.questSubText.visible = false;
         }
         else
         {
            this.questMainText.text = mainTxt;
            this.questSubText.text = subTxt;
            this.normalText.visible = false;
            this.questMainText.visible = true;
            this.questSubText.visible = true;
         }
         if(ap == 0)
         {
            this.apText.text = "";
         }
         else
         {
            this.apText.text = ap.toString() + " " + LangManager.getString(102);
         }
      }
      
      public function setGreyOut(flag:Boolean) : *
      {
         this.greyout.visible = flag;
         this.buttonBG.visible = !flag;
         if(flag)
         {
            this.questMainText.textColor = 6710886;
            this.questSubText.textColor = 5592405;
            this.normalText.textColor = 5592405;
            this.apText.textColor = 4473924;
         }
         else
         {
            this.questMainText.textColor = 16763955;
            this.questSubText.textColor = 13421772;
            this.normalText.textColor = 16777215;
            this.apText.textColor = 13421772;
         }
      }
   }
}

