package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1547")]
   public class DragonDanceUI extends MovieClip
   {
      
      public static var instance:DragonDanceUI;
      
      public var centerButton:MovieClip;
      
      public var node0:SkillNode;
      
      public var node1:SkillNode;
      
      public var node2:SkillNode;
      
      public var node3:SkillNode;
      
      public var node4:SkillNode;
      
      public var node5:SkillNode;
      
      public var greenCircle:MovieClip;
      
      public var captionText:TextField;
      
      public var exitButton:SimpleButton;
      
      public var node6:SkillNode;
      
      public var redCircle:MovieClip;
      
      public var node7:SkillNode;
      
      internal var nodesArray:Array;
      
      internal var seqArray:Array;
      
      internal var clickedArray:Array;
      
      internal var clickFunctionArray:Array;
      
      internal var mouseoverFunctionArray:Array;
      
      internal var mouseoutFunctionArray:Array;
      
      internal var earlierHeavenLabel:Array;
      
      internal var laterHeavenLabel:Array;
      
      internal var sequence:String = "";
      
      internal var earlierHeaven:Boolean;
      
      internal var danceTarget:DragonDanceInteractiveStageObject;
      
      public function DragonDanceUI()
      {
         var i:int;
         var skillNode:SkillNode = null;
         super();
         instance = this;
         this.nodesArray = [this.node0,this.node1,this.node2,this.node3,this.node4,this.node5,this.node6,this.node7];
         this.clickedArray = [false,false,false,false,false,false,false,false];
         this.earlierHeavenLabel = ["sky","wind","water","mountain","earth","thunder","fire","lake"];
         this.laterHeavenLabel = ["fire","earth","lake","sky","water","mountain","thunder","wind"];
         this.clickFunctionArray = [function():*
         {
            nodeClick(0);
         },function():*
         {
            nodeClick(1);
         },function():*
         {
            nodeClick(2);
         },function():*
         {
            nodeClick(3);
         },function():*
         {
            nodeClick(4);
         },function():*
         {
            nodeClick(5);
         },function():*
         {
            nodeClick(6);
         },function():*
         {
            nodeClick(7);
         }];
         this.mouseoverFunctionArray = [function():*
         {
            nodeMouseOver(0);
         },function():*
         {
            nodeMouseOver(1);
         },function():*
         {
            nodeMouseOver(2);
         },function():*
         {
            nodeMouseOver(3);
         },function():*
         {
            nodeMouseOver(4);
         },function():*
         {
            nodeMouseOver(5);
         },function():*
         {
            nodeMouseOver(6);
         },function():*
         {
            nodeMouseOver(7);
         }];
         this.mouseoutFunctionArray = [function():*
         {
            nodeMouseOut(0);
         },function():*
         {
            nodeMouseOut(1);
         },function():*
         {
            nodeMouseOut(2);
         },function():*
         {
            nodeMouseOut(3);
         },function():*
         {
            nodeMouseOut(4);
         },function():*
         {
            nodeMouseOut(5);
         },function():*
         {
            nodeMouseOut(6);
         },function():*
         {
            nodeMouseOut(7);
         }];
         for(i = 0; i < 8; i++)
         {
            this.nodesArray[i].word.mouseEnabled = false;
            this.nodesArray[i].mouseChildren = false;
            this.nodesArray[i].node.buttonMode = true;
         }
         this.seqArray = new Array();
         for(i = 0; i < 16; i++)
         {
            skillNode = new SkillNode();
            this.seqArray[i] = skillNode;
            skillNode.x = 400 + i * 50;
            skillNode.y = 459;
            skillNode.scaleX = 0.6;
            skillNode.scaleY = 0.6;
            skillNode.mouseChildren = false;
            skillNode.mouseEnabled = false;
            addChild(skillNode);
         }
         this.centerButton.buttonMode = true;
         this.centerButton.mouseEnabled = true;
         LangManager.initTextField(this.captionText);
         this.captionText.mouseEnabled = false;
      }
      
      internal function addEventListeners() : *
      {
         for(var i:int = 0; i < 8; i++)
         {
            this.nodesArray[i].node.addEventListener(MouseEvent.CLICK,this.clickFunctionArray[i]);
            this.nodesArray[i].node.addEventListener(MouseEvent.MOUSE_OVER,this.mouseoverFunctionArray[i]);
            this.nodesArray[i].node.addEventListener(MouseEvent.MOUSE_OUT,this.mouseoutFunctionArray[i]);
         }
         this.centerButton.addEventListener(MouseEvent.CLICK,this.centerClick);
         this.centerButton.addEventListener(MouseEvent.MOUSE_OVER,this.centerMouseOver);
         this.centerButton.addEventListener(MouseEvent.MOUSE_OUT,this.centerMouseOut);
         this.exitButton.addEventListener(MouseEvent.CLICK,this.exitClick);
      }
      
      internal function removeEventListeners() : *
      {
         for(var i:int = 0; i < 8; i++)
         {
            this.nodesArray[i].node.removeEventListener(MouseEvent.CLICK,this.clickFunctionArray[i]);
            this.nodesArray[i].node.removeEventListener(MouseEvent.MOUSE_OVER,this.mouseoverFunctionArray[i]);
            this.nodesArray[i].node.removeEventListener(MouseEvent.MOUSE_OUT,this.mouseoutFunctionArray[i]);
         }
         this.centerButton.removeEventListener(MouseEvent.CLICK,this.centerClick);
         this.centerButton.removeEventListener(MouseEvent.MOUSE_OVER,this.centerMouseOver);
         this.centerButton.removeEventListener(MouseEvent.MOUSE_OUT,this.centerMouseOut);
         this.exitButton.removeEventListener(MouseEvent.CLICK,this.exitClick);
      }
      
      internal function setEarlierHeaven() : *
      {
         var i:int = 0;
         this.greenCircle.visible = true;
         this.redCircle.visible = false;
         this.centerButton.gotoAndStop("green");
         this.sequence = "";
         this.captionText.text = "";
         for(i = 0; i < 16; i++)
         {
            this.seqArray[i].visible = false;
         }
         this.clickedArray = [false,false,false,false,false,false,false,false];
         this.earlierHeaven = true;
         for(i = 0; i < 8; i++)
         {
            if(this.hasNode(i))
            {
               this.nodesArray[i].word.visible = true;
               this.nodesArray[i].word.gotoAndStop(i + 1);
               this.nodesArray[i].node.gotoAndStop("green");
               this.nodesArray[i].mouseEnabled = true;
               this.nodesArray[i].mouseChildren = true;
            }
            else
            {
               this.nodesArray[i].word.visible = false;
               this.nodesArray[i].node.gotoAndStop("greendisabled");
               this.nodesArray[i].mouseEnabled = false;
               this.nodesArray[i].mouseChildren = false;
            }
         }
      }
      
      internal function setLaterHeaven() : *
      {
         this.earlierHeaven = false;
         this.greenCircle.visible = false;
         this.redCircle.visible = true;
         this.captionText.text = "";
         this.centerButton.gotoAndStop("red");
         for(var i:int = 0; i < 8; i++)
         {
            if(this.hasNode(i))
            {
               this.nodesArray[i].word.visible = true;
               this.nodesArray[i].word.gotoAndStop(i + 21);
               this.nodesArray[i].node.gotoAndStop("red");
               this.nodesArray[i].mouseEnabled = true;
               this.nodesArray[i].mouseChildren = true;
            }
            else
            {
               this.nodesArray[i].word.visible = false;
               this.nodesArray[i].mouseEnabled = false;
               this.nodesArray[i].mouseChildren = false;
               this.nodesArray[i].node.gotoAndStop("reddisabled");
            }
         }
         this.clickedArray = [false,false,false,false,false,false,false,false];
      }
      
      public function show(danceTarget:DragonDanceInteractiveStageObject = null) : *
      {
         this.danceTarget = danceTarget;
         OverworldHUD.instance.initForCutscene();
         visible = true;
         this.addEventListeners();
         this.setEarlierHeaven();
         if(danceTarget != null && danceTarget.getSequence() != "")
         {
            this.displaySequence();
         }
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
         InputManager.setAdventureMode();
         OverworldHUD.instance.initForAdventureMode();
      }
      
      internal function hasNode(num:int) : Boolean
      {
         if(this.danceTarget != null)
         {
            if(this.earlierHeaven && this.danceTarget.nodeTaught() == num)
            {
               return true;
            }
            if(!this.earlierHeaven && this.danceTarget.nodeTaught() == num + 8)
            {
               return true;
            }
         }
         if(this.earlierHeaven)
         {
            if(StatsManager.getStat(40002 + num) == 1)
            {
               return true;
            }
            if(num == 6 && StatsManager.getStat(1056) == 1)
            {
               return true;
            }
            if(num == 2 && StatsManager.getStat(1057) == 1)
            {
               return true;
            }
            if(num == 1 && StatsManager.getStat(1058) == 1)
            {
               return true;
            }
            if(num == 4 && StatsManager.getStat(1059) == 1)
            {
               return true;
            }
            return false;
         }
         if(StatsManager.getStat(40010 + num) == 1)
         {
            return true;
         }
         if(num == 0 && StatsManager.getStat(1060) == 1)
         {
            return true;
         }
         if(num == 4 && StatsManager.getStat(1061) == 1)
         {
            return true;
         }
         if(num == 7 && StatsManager.getStat(1062) == 1)
         {
            return true;
         }
         if(num == 1 && StatsManager.getStat(1063) == 1)
         {
            return true;
         }
         return false;
      }
      
      internal function nodeClick(num:int) : *
      {
         var pose:String = null;
         if(this.clickedArray[num])
         {
            return;
         }
         if(this.sequence == "")
         {
            StatsManager.getPlayer().getMCS().faceRight();
         }
         this.clickedArray[num] = true;
         this.sequence += num.toString();
         if(this.earlierHeaven)
         {
            this.nodesArray[num].node.gotoAndStop("selected");
            this.nodesArray[num].word.gotoAndStop(num + 11);
         }
         else
         {
            this.nodesArray[num].node.gotoAndStop("selected");
            this.nodesArray[num].word.gotoAndStop(num + 31);
         }
         this.displaySequence();
         if(Boolean(this.earlierHeaven && this.sequence.length == 4) && Boolean(this.clickedArray[1]) && Boolean(this.clickedArray[2]) && Boolean(this.clickedArray[4]) && Boolean(this.clickedArray[6]))
         {
            this.setLaterHeaven();
         }
         if(StatsManager.getPlayer().canChangeStance())
         {
            if(this.earlierHeaven)
            {
               if(num == 0)
               {
                  pose = MCSActor.POSE4;
               }
               else if(num == 1)
               {
                  pose = MCSActor.POSE8;
               }
               else if(num == 2)
               {
                  pose = MCSActor.POSE5;
               }
               else if(num == 3)
               {
                  pose = MCSActor.POSE6;
               }
               else if(num == 4)
               {
                  pose = MCSActor.POSE2;
               }
               else if(num == 5)
               {
                  pose = MCSActor.POSE7;
               }
               else if(num == 6)
               {
                  pose = MCSActor.POSE1;
               }
               else if(num == 7)
               {
                  pose = MCSActor.POSE3;
               }
            }
            else if(num == 0)
            {
               pose = MCSActor.POSE1;
            }
            else if(num == 1)
            {
               pose = MCSActor.POSE2;
            }
            else if(num == 2)
            {
               pose = MCSActor.POSE3;
            }
            else if(num == 3)
            {
               pose = MCSActor.POSE4;
            }
            else if(num == 4)
            {
               pose = MCSActor.POSE5;
            }
            else if(num == 5)
            {
               pose = MCSActor.POSE6;
            }
            else if(num == 6)
            {
               pose = MCSActor.POSE7;
            }
            else if(num == 7)
            {
               pose = MCSActor.POSE8;
            }
            StatsManager.getPlayer().startAnim(pose);
            NetworkManager.instance.playerEmote(pose);
            if(this.danceTarget != null)
            {
               this.danceTarget.setPose(pose);
            }
         }
         if(this.danceTarget != null && this.danceTarget.getSequence() == this.sequence)
         {
            this.hide();
            this.danceTarget.validSequence();
         }
      }
      
      internal function displaySequence() : *
      {
         var displaySkillNode:SkillNode = null;
         var num:int = 0;
         var i:int = 0;
         var checkArray:Array = null;
         var j:int = 0;
         var targetnum:int = 0;
         var inputLength:int = this.sequence.length;
         var targetLength:int = 0;
         var targetSequence:String = "";
         var targetLaterHeaven:Boolean = false;
         if(this.danceTarget != null)
         {
            targetSequence = this.danceTarget.getSequence();
            targetLength = targetSequence.length;
            if(targetLength > 4)
            {
               checkArray = [false,false,false,false];
               for(j = 0; j < 4; j++)
               {
                  targetnum = int(targetSequence.charAt(j));
                  if(targetnum == 1)
                  {
                     checkArray[0] = true;
                  }
                  else if(targetnum == 2)
                  {
                     checkArray[1] = true;
                  }
                  else if(targetnum == 4)
                  {
                     checkArray[2] = true;
                  }
                  else if(targetnum == 6)
                  {
                     checkArray[3] = true;
                  }
               }
               targetLaterHeaven = Boolean(checkArray[0]) && Boolean(checkArray[1]) && Boolean(checkArray[2]) && Boolean(checkArray[3]);
            }
         }
         var highestLength:* = inputLength;
         if(targetLength > inputLength)
         {
            highestLength = targetLength;
         }
         for(i = 0; i < 16; i++)
         {
            displaySkillNode = this.seqArray[i];
            if(inputLength > i)
            {
               displaySkillNode.visible = true;
               num = int(this.sequence.charAt(i));
               if(!this.earlierHeaven && i > 3)
               {
                  displaySkillNode.node.gotoAndStop("red");
                  displaySkillNode.word.gotoAndStop(num + 21);
               }
               else
               {
                  displaySkillNode.node.gotoAndStop("green");
                  displaySkillNode.word.gotoAndStop(num + 1);
               }
               displaySkillNode.x = 400 + i * 50 - (highestLength - 1) * 25;
            }
            else if(i < targetLength)
            {
               displaySkillNode.visible = true;
               num = int(targetSequence.charAt(i));
               if(targetLaterHeaven && i > 3)
               {
                  displaySkillNode.node.gotoAndStop("reddisabled");
                  displaySkillNode.word.gotoAndStop(num + 21);
               }
               else
               {
                  displaySkillNode.node.gotoAndStop("greendisabled");
                  displaySkillNode.word.gotoAndStop(num + 1);
               }
               displaySkillNode.x = 400 + i * 50 - (highestLength - 1) * 25;
            }
            else
            {
               displaySkillNode.visible = false;
            }
         }
      }
      
      internal function nodeMouseOver(num:int) : *
      {
         if(this.earlierHeaven)
         {
            this.captionText.text = this.earlierHeavenLabel[num];
         }
         else
         {
            this.captionText.text = this.laterHeavenLabel[num];
         }
         if(this.clickedArray[num])
         {
            return;
         }
         if(this.earlierHeaven)
         {
            this.nodesArray[num].node.gotoAndStop("greenmouseover");
         }
         else
         {
            this.nodesArray[num].node.gotoAndStop("redmouseover");
         }
      }
      
      internal function nodeMouseOut(num:int) : *
      {
         this.captionText.text = "";
         if(!this.earlierHeaven && !this.hasNode(num))
         {
            this.nodesArray[num].node.gotoAndStop("reddisabled");
            return;
         }
         if(this.clickedArray[num])
         {
            return;
         }
         if(this.earlierHeaven)
         {
            this.nodesArray[num].node.gotoAndStop("green");
         }
         else
         {
            this.nodesArray[num].node.gotoAndStop("red");
         }
      }
      
      internal function centerClick(event:MouseEvent) : *
      {
         if(this.sequence == "1")
         {
            SoundManager.instance.playFart();
            NetworkManager.instance.playerEmote("fart");
         }
         if(this.earlierHeaven)
         {
            StatsManager.getPlayer().startAnim(MCSActor.POSE9);
            NetworkManager.instance.playerEmote(MCSActor.POSE9);
         }
         else
         {
            StatsManager.getPlayer().startAnim(MCSActor.POSE10);
            NetworkManager.instance.playerEmote(MCSActor.POSE10);
         }
         this.hide();
         if(this.danceTarget != null)
         {
            if(this.danceTarget.getSequence() == this.sequence)
            {
               this.danceTarget.validSequence();
            }
            else
            {
               this.danceTarget.invalidSequence();
            }
         }
      }
      
      internal function centerMouseOver(event:MouseEvent) : *
      {
         if(this.earlierHeaven)
         {
            this.centerButton.gotoAndStop("greenmouseover");
         }
         else
         {
            this.centerButton.gotoAndStop("redmouseover");
         }
      }
      
      internal function centerMouseOut(event:MouseEvent) : *
      {
         if(this.earlierHeaven)
         {
            this.centerButton.gotoAndStop("green");
         }
         else
         {
            this.centerButton.gotoAndStop("red");
         }
      }
      
      internal function exitClick(event:MouseEvent) : *
      {
         this.hide();
      }
   }
}

