package com.taomee.seer2.app.processor.activity.sniper
{
   import com.taomee.seer2.app.arena.ArenaScene;
   import com.taomee.seer2.app.arena.cmd.ArenaResourceLoadCMD;
   import com.taomee.seer2.app.arena.data.FighterInfo;
   import com.taomee.seer2.app.arena.data.FighterTeam;
   import com.taomee.seer2.app.arena.ui.toolbar.sub.FighterTip;
   import com.taomee.seer2.core.utils.DisplayObjectUtil;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class SniperPlayAnimation
   {
      
      private static var _globalIsPanelVisible:Boolean = true;
      
      private static var _globalIsOpListVisible:Boolean = true;
      
      private static var _globalIsOpAllExpanded:Boolean = false;
      
      private static var _globalOpSavedStates:Array = [];
      
      private static var _globalIsMyListVisible:Boolean = true;
      
      private static var _globalIsMyAllExpanded:Boolean = false;
      
      private static var _globalMySavedStates:Array = [];
      
      private var DisplayController:Sprite;
      
      private var myFont:TextFormat;
      
      private var _contentValue:Sprite;
      
      private var _scene:ArenaScene;
      
      private var opPetDisplay:Sprite;
      
      private var PetDisplays:Vector.<TextField>;
      
      private var PetDisplaySps:Vector.<Sprite>;
      
      private var oppositeTeam:FighterTeam = null;
      
      private var _tips:Vector.<FighterTip>;
      
      private var titleContainer:Sprite;
      
      private var petListContainer:Sprite;
      
      private var btnListToggle:Sprite;
      
      private var titleDisplayTxt:TextField;
      
      private var expandAllBtn:Sprite;
      
      private var expandAllTxt:TextField;
      
      private var isAllExpanded:Boolean = false;
      
      private var expandedTipIndex:int = -1;
      
      private var savedStates:Array = [];
      
      private var opHashes:Array = [];
      
      private var opActiveSlotIndex:int = 0;
      
      private var opDeadSlots:Array = [false,false,false,false,false,false];
      
      private var lastOpMainInfo:FighterInfo = null;
      
      private var myPetDisplay:Sprite;
      
      private var myPetDisplays:Vector.<TextField>;
      
      private var myPetDisplaySps:Vector.<Sprite>;
      
      private var myTeam:FighterTeam = null;
      
      private var _myTips:Vector.<FighterTip>;
      
      private var myTitleContainer:Sprite;
      
      private var myPetListContainer:Sprite;
      
      private var myBtnListToggle:Sprite;
      
      private var myTitleDisplayTxt:TextField;
      
      private var myExpandAllBtn:Sprite;
      
      private var myExpandAllTxt:TextField;
      
      private var myIsAllExpanded:Boolean = false;
      
      private var myExpandedTipIndex:int = -1;
      
      private var mySavedStates:Array = [];
      
      private var myHashes:Array = [];
      
      private var myActiveSlotIndex:int = 0;
      
      private var myDeadSlots:Array = [false,false,false,false,false,false];
      
      private var lastMyMainInfo:FighterInfo = null;
      
      public function SniperPlayAnimation(param1:ArenaScene, param2:Sprite)
      {
         super();
         this._scene = param1;
         this._contentValue = param2;
         PetDisplaySps = new Vector.<Sprite>();
         myPetDisplaySps = new Vector.<Sprite>();
         this.isAllExpanded = _globalIsOpAllExpanded;
         this.savedStates = _globalOpSavedStates.concat();
         this.myIsAllExpanded = _globalIsMyAllExpanded;
         this.mySavedStates = _globalMySavedStates.concat();
         try
         {
            this.createPetDisplay();
            this.createDisplayController();
         }
         catch(e:Error)
         {
         }
      }
      
      private function bringToFront(e:MouseEvent) : void
      {
         var target:Sprite = e.currentTarget as Sprite;
         if(_contentValue && target && _contentValue.contains(target))
         {
            _contentValue.setChildIndex(target,_contentValue.numChildren - 1);
         }
      }
      
      private function sendToBack(e:MouseEvent) : void
      {
         var target:Sprite = e.currentTarget as Sprite;
         if(_contentValue && target && _contentValue.contains(target))
         {
            _contentValue.setChildIndex(target,0);
         }
      }
      
      private function getFighterHash(info:FighterInfo) : String
      {
         var hash:String;
         var j:int;
         if(!info)
         {
            return "";
         }
         hash = "pet";
         try
         {
            hash = info.hasOwnProperty("name") && info.name ? info.name : "未知";
            if(info.skillInfoVec)
            {
               j = 0;
               while(j < info.skillInfoVec.length)
               {
                  if(info.skillInfoVec[j])
                  {
                     hash += "_" + info.skillInfoVec[j].name;
                  }
                  j++;
               }
            }
         }
         catch(e:Error)
         {
         }
         return hash;
      }
      
      private function getParsedList(team:FighterTeam, isMyTeam:Boolean) : Vector.<FighterInfo>
      {
         var maxCount:int;
         var i:int;
         var mf:FighterInfo;
         var foundSlot:int;
         var j:int;
         var k:int;
         var activeSlot:int;
         var deadSlots:Array;
         var list:Vector.<FighterInfo> = new Vector.<FighterInfo>();
         try
         {
            if(!team || !team.fighterVec)
            {
               return list;
            }
            maxCount = Math.min(6,team.fighterVec.length);
            i = 0;
            while(i < maxCount)
            {
               list.push(team.fighterVec[i] ? team.fighterVec[i].fighterInfo : null);
               i++;
            }
            mf = null;
            if(team.mainFighter && team.mainFighter.fighterInfo)
            {
               mf = team.mainFighter.fighterInfo;
               if(isMyTeam)
               {
                  lastMyMainInfo = mf;
               }
               else
               {
                  lastOpMainInfo = mf;
               }
            }
            else
            {
               mf = isMyTeam ? lastMyMainInfo : lastOpMainInfo;
            }
            if(mf)
            {
               foundSlot = -1;
               j = 0;
               while(j < maxCount)
               {
                  if(list[j] == mf)
                  {
                     foundSlot = j;
                     break;
                  }
                  j++;
               }
               if(foundSlot == -1 && mf.hasOwnProperty("catchTime") && mf.catchTime > 0)
               {
                  k = 0;
                  while(k < maxCount)
                  {
                     if(list[k] && list[k].hasOwnProperty("catchTime") && list[k].catchTime == mf.catchTime)
                     {
                        foundSlot = k;
                        break;
                     }
                     k++;
                  }
               }
               if(foundSlot != -1)
               {
                  if(isMyTeam)
                  {
                     myActiveSlotIndex = foundSlot;
                  }
                  else
                  {
                     opActiveSlotIndex = foundSlot;
                  }
               }
               activeSlot = isMyTeam ? myActiveSlotIndex : opActiveSlotIndex;
               deadSlots = isMyTeam ? myDeadSlots : opDeadSlots;
               if(activeSlot >= 0 && activeSlot < 6)
               {
                  try
                  {
                     if(mf.hasOwnProperty("hp") && mf.hp <= 0)
                     {
                        deadSlots[activeSlot] = true;
                     }
                     else
                     {
                        deadSlots[activeSlot] = false;
                     }
                  }
                  catch(e2:Error)
                  {
                  }
               }
               if(activeSlot >= 0 && activeSlot < maxCount)
               {
                  list[activeSlot] = mf;
               }
            }
         }
         catch(e:Error)
         {
         }
         return list;
      }
      
      private function createPetDisplay() : void
      {
         myFont = new TextFormat();
         myFont.size = 16;
         myFont.bold = true;
         myFont.color = 16777215;
         opPetDisplay = new Sprite();
         opPetDisplay.x = 320;
         opPetDisplay.y = 440;
         opPetDisplay.alpha = 0.9;
         opPetDisplay.visible = _globalIsPanelVisible;
         this._contentValue.addChildAt(this.opPetDisplay,0);
         this.opPetDisplay.addEventListener(MouseEvent.ROLL_OVER,bringToFront);
         this.opPetDisplay.addEventListener(MouseEvent.ROLL_OUT,sendToBack);
         titleContainer = new Sprite();
         this.opPetDisplay.addChild(titleContainer);
         petListContainer = new Sprite();
         petListContainer.visible = _globalIsOpListVisible;
         this.opPetDisplay.addChild(petListContainer);
         PetDisplays = new Vector.<TextField>();
         myPetDisplay = new Sprite();
         myPetDisplay.x = 320;
         myPetDisplay.y = 350;
         myPetDisplay.alpha = 0.9;
         myPetDisplay.visible = false;
         this._contentValue.addChildAt(this.myPetDisplay,0);
         this.myPetDisplay.addEventListener(MouseEvent.ROLL_OVER,bringToFront);
         this.myPetDisplay.addEventListener(MouseEvent.ROLL_OUT,sendToBack);
         myTitleContainer = new Sprite();
         this.myPetDisplay.addChild(myTitleContainer);
         myPetListContainer = new Sprite();
         myPetListContainer.visible = _globalIsMyListVisible;
         this.myPetDisplay.addChild(myPetListContainer);
         myPetDisplays = new Vector.<TextField>();
      }
      
      private function createDisplayController() : void
      {
         var openOrClose:TextField;
         var nickName:String;
         var headText:String;
         var realHeight:Number;
         try
         {
            openOrClose = new TextField();
            openOrClose.x = 0;
            openOrClose.y = 0;
            openOrClose.width = 140;
            openOrClose.multiline = true;
            openOrClose.wordWrap = true;
            openOrClose.autoSize = TextFieldAutoSize.LEFT;
            openOrClose.defaultTextFormat = myFont;
            nickName = "未知";
            try
            {
               nickName = this._scene.rightTeam.teamInfo.fightUserInfoVec[0].nick;
            }
            catch(e:Error)
            {
            }
            headText = "对手:" + nickName + "\n春树提醒您:";
            if(ArenaResourceLoadCMD.theSide == 1)
            {
               headText += "\n我方是邀请方";
            }
            else if(ArenaResourceLoadCMD.theSide == 2)
            {
               headText += "\n我方是应战方";
            }
            openOrClose.text = headText;
            openOrClose.mouseEnabled = false;
            realHeight = openOrClose.height;
            DisplayController = new Sprite();
            DisplayController.buttonMode = true;
            DisplayController.graphics.beginFill(0);
            DisplayController.graphics.drawRect(0,0,140,realHeight + 5);
            DisplayController.graphics.endFill();
            DisplayController.x = 50;
            DisplayController.y = 470 - (realHeight + 5);
            DisplayController.alpha = 0.8;
            this._contentValue.addChildAt(this.DisplayController,0);
            this.DisplayController.addChild(openOrClose);
            DisplayController.addEventListener(MouseEvent.CLICK,this.controlPanel);
            DisplayController.addEventListener(MouseEvent.ROLL_OVER,bringToFront);
            DisplayController.addEventListener(MouseEvent.ROLL_OUT,sendToBack);
         }
         catch(e:Error)
         {
         }
      }
      
      private function controlPanel(param1:MouseEvent) : void
      {
         if(opPetDisplay)
         {
            opPetDisplay.visible = !opPetDisplay.visible;
            _globalIsPanelVisible = opPetDisplay.visible;
         }
         if(myPetDisplay)
         {
            myPetDisplay.visible = false;
         }
      }
      
      private function togglePetList(param1:MouseEvent) : void
      {
         if(petListContainer)
         {
            petListContainer.visible = !petListContainer.visible;
            _globalIsOpListVisible = petListContainer.visible;
            if(expandAllBtn)
            {
               expandAllBtn.visible = petListContainer.visible;
            }
         }
      }
      
      private function syncExpandAllBtn() : void
      {
         var anyVisible:Boolean;
         var t:FighterTip;
         try
         {
            if(!_tips || !expandAllTxt)
            {
               return;
            }
            anyVisible = false;
            for each(t in _tips)
            {
               if(t && t.visible)
               {
                  anyVisible = true;
                  break;
               }
            }
            isAllExpanded = anyVisible;
            _globalIsOpAllExpanded = isAllExpanded;
            expandAllTxt.text = isAllExpanded ? "一键关闭" : "一键展开";
         }
         catch(e:Error)
         {
         }
      }
      
      private function onExpandAllClick(e:MouseEvent) : void
      {
         var i:int;
         var tip:FighterTip;
         var currentList:Vector.<FighterInfo>;
         var hasSaved:Boolean;
         try
         {
            currentList = getParsedList(oppositeTeam,false);
            if(isAllExpanded)
            {
               savedStates = [];
               i = 0;
               while(i < _tips.length)
               {
                  if(_tips[i])
                  {
                     savedStates.push({
                        "visible":_tips[i].visible,
                        "expanded":_tips[i].isExpanded
                     });
                  }
                  i++;
               }
               _globalOpSavedStates = savedStates.concat();
               expandedTipIndex = -1;
               i = 0;
               while(i < _tips.length)
               {
                  tip = _tips[i];
                  if(tip && currentList.length > i && currentList[i])
                  {
                     tip.isExpanded = false;
                     tip.visible = false;
                     tip.setFighterInfo(currentList[i]);
                  }
                  i++;
               }
            }
            else
            {
               expandedTipIndex = -1;
               hasSaved = savedStates.length > 0;
               i = 0;
               while(i < _tips.length)
               {
                  tip = _tips[i];
                  if(tip && currentList.length > i && currentList[i])
                  {
                     if(hasSaved && savedStates.length > i)
                     {
                        tip.visible = savedStates[i].visible;
                        tip.isExpanded = savedStates[i].expanded;
                        if(tip.isExpanded)
                        {
                           expandedTipIndex = i;
                        }
                     }
                     else
                     {
                        tip.visible = true;
                        tip.isExpanded = false;
                     }
                     tip.setFighterInfo(currentList[i]);
                  }
                  i++;
               }
            }
            isAllExpanded = !isAllExpanded;
            syncExpandAllBtn();
         }
         catch(e:Error)
         {
         }
      }
      
      private function myTogglePetList(param1:MouseEvent) : void
      {
         if(myPetListContainer)
         {
            myPetListContainer.visible = !myPetListContainer.visible;
            _globalIsMyListVisible = myPetListContainer.visible;
            if(myExpandAllBtn)
            {
               myExpandAllBtn.visible = false;
            }
         }
      }
      
      private function mySyncExpandAllBtn() : void
      {
         var anyVisible:Boolean;
         var t:FighterTip;
         try
         {
            if(!_myTips || !myExpandAllTxt)
            {
               return;
            }
            anyVisible = false;
            for each(t in _myTips)
            {
               if(t && t.visible)
               {
                  anyVisible = true;
                  break;
               }
            }
            myIsAllExpanded = anyVisible;
            _globalIsMyAllExpanded = myIsAllExpanded;
            myExpandAllTxt.text = "";
         }
         catch(e:Error)
         {
         }
      }
      
      private function myOnExpandAllClick(e:MouseEvent) : void
      {
         var i:int;
         var tip:FighterTip;
         var currentList:Vector.<FighterInfo>;
         var hasSaved:Boolean;
         try
         {
            currentList = getParsedList(myTeam,true);
            if(myIsAllExpanded)
            {
               mySavedStates = [];
               i = 0;
               while(i < _myTips.length)
               {
                  if(_myTips[i])
                  {
                     mySavedStates.push({
                        "visible":_myTips[i].visible,
                        "expanded":_myTips[i].isExpanded
                     });
                  }
                  i++;
               }
               _globalMySavedStates = mySavedStates.concat();
               myExpandedTipIndex = -1;
               i = 0;
               while(i < _myTips.length)
               {
                  tip = _myTips[i];
                  if(tip && currentList.length > i && currentList[i])
                  {
                     tip.isExpanded = false;
                     tip.visible = false;
                     tip.setFighterInfo(currentList[i]);
                  }
                  i++;
               }
            }
            else
            {
               myExpandedTipIndex = -1;
               hasSaved = mySavedStates.length > 0;
               i = 0;
               while(i < _myTips.length)
               {
                  tip = _myTips[i];
                  if(tip && currentList.length > i && currentList[i])
                  {
                     if(hasSaved && mySavedStates.length > i)
                     {
                        tip.visible = mySavedStates[i].visible;
                        tip.isExpanded = mySavedStates[i].expanded;
                        if(tip.isExpanded)
                        {
                           myExpandedTipIndex = i;
                        }
                     }
                     else
                     {
                        tip.visible = true;
                        tip.isExpanded = false;
                     }
                     tip.setFighterInfo(currentList[i]);
                  }
                  i++;
               }
            }
            myIsAllExpanded = !myIsAllExpanded;
            mySyncExpandAllBtn();
         }
         catch(e:Error)
         {
         }
      }
      
      private function onTipExpandClicked(tip:FighterTip) : void
      {
         var index:int;
         var currentList:Vector.<FighterInfo>;
         var i:int;
         try
         {
            index = int(_tips.indexOf(tip));
            currentList = getParsedList(oppositeTeam,false);
            if(index == -1 || currentList.length <= index || !currentList[index])
            {
               return;
            }
            if(tip.isExpanded)
            {
               expandedTipIndex = -1;
               tip.isExpanded = false;
               tip.setFighterInfo(currentList[index]);
            }
            else
            {
               i = 0;
               while(i < _tips.length)
               {
                  if(_tips[i] && currentList.length > i && currentList[i])
                  {
                     _tips[i].visible = false;
                     _tips[i].isExpanded = false;
                     _tips[i].setFighterInfo(currentList[i]);
                  }
                  i++;
               }
               expandedTipIndex = index;
               tip.isExpanded = true;
               tip.setFighterInfo(currentList[index]);
               tip.visible = true;
            }
            syncExpandAllBtn();
         }
         catch(e:Error)
         {
         }
      }
      
      private function myOnTipExpandClicked(tip:FighterTip) : void
      {
         var index:int;
         var currentList:Vector.<FighterInfo>;
         var i:int;
         try
         {
            index = int(_myTips.indexOf(tip));
            currentList = getParsedList(myTeam,true);
            if(index == -1 || currentList.length <= index || !currentList[index])
            {
               return;
            }
            if(tip.isExpanded)
            {
               myExpandedTipIndex = -1;
               tip.isExpanded = false;
               tip.setFighterInfo(currentList[index]);
            }
            else
            {
               i = 0;
               while(i < _myTips.length)
               {
                  if(_myTips[i] && currentList.length > i && currentList[i])
                  {
                     _myTips[i].visible = false;
                     _myTips[i].isExpanded = false;
                     _myTips[i].setFighterInfo(currentList[i]);
                  }
                  i++;
               }
               myExpandedTipIndex = index;
               tip.isExpanded = true;
               tip.setFighterInfo(currentList[index]);
               tip.visible = true;
            }
            mySyncExpandAllBtn();
         }
         catch(e:Error)
         {
         }
      }
      
      public function initializePetDisplay(rightTeam:FighterTeam) : void
      {
         try
         {
            if(rightTeam != null)
            {
               initOpponentTeam(rightTeam);
            }
            if(this._scene && this._scene.leftTeam != null)
            {
               initMyTeam(this._scene.leftTeam);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function initOpponentTeam(rightTeam:FighterTeam) : void
      {
         var baseList:Vector.<FighterInfo>;
         var opMaxCount:int;
         var addTip:Function;
         var onMouseOver:Function;
         var onMouseOut:Function;
         var onClickTipToggle:Function;
         var i:int;
         var aFighterInfo:FighterInfo;
         var aPetDisplaySp:Sprite;
         var aPetDisplay:TextField;
         try
         {
            DisplayObjectUtil.removeAllChildren(titleContainer);
            DisplayObjectUtil.removeAllChildren(petListContainer);
            this.PetDisplays = new Vector.<TextField>();
            this.PetDisplaySps = new Vector.<Sprite>();
            this._tips = new Vector.<FighterTip>();
            this.opHashes = [];
            if(_globalOpSavedStates.length == 0)
            {
               this.savedStates = [];
            }
            this.opDeadSlots = [false,false,false,false,false,false];
            this.oppositeTeam = rightTeam;
            this.lastOpMainInfo = null;
            baseList = getParsedList(rightTeam,false);
            opMaxCount = int(baseList.length);
            titleContainer.graphics.clear();
            titleContainer.graphics.beginFill(0,0.8);
            titleContainer.graphics.drawRect(0,0,110,80);
            titleContainer.graphics.endFill();
            titleContainer.x = -110;
            titleContainer.y = 0;
            btnListToggle = new Sprite();
            btnListToggle.buttonMode = true;
            btnListToggle.graphics.beginFill(0,0);
            btnListToggle.graphics.drawRect(0,0,110,40);
            btnListToggle.graphics.endFill();
            btnListToggle.addEventListener(MouseEvent.CLICK,togglePetList);
            titleDisplayTxt = new TextField();
            titleDisplayTxt.x = 0;
            titleDisplayTxt.y = 6;
            titleDisplayTxt.width = 110;
            titleDisplayTxt.height = 30;
            titleDisplayTxt.defaultTextFormat = myFont;
            titleDisplayTxt.text = "||对方精灵||";
            titleDisplayTxt.mouseEnabled = false;
            btnListToggle.addChild(titleDisplayTxt);
            titleContainer.addChild(btnListToggle);
            expandAllBtn = new Sprite();
            expandAllBtn.buttonMode = true;
            expandAllBtn.y = 40;
            expandAllBtn.graphics.beginFill(0,0);
            expandAllBtn.graphics.drawRect(0,0,110,40);
            expandAllBtn.graphics.endFill();
            expandAllBtn.addEventListener(MouseEvent.CLICK,onExpandAllClick);
            expandAllTxt = new TextField();
            expandAllTxt.x = 0;
            expandAllTxt.y = 6;
            expandAllTxt.width = 110;
            expandAllTxt.height = 30;
            expandAllTxt.defaultTextFormat = myFont;
            expandAllTxt.text = "一键展开";
            expandAllTxt.mouseEnabled = false;
            expandAllBtn.addChild(expandAllTxt);
            expandAllBtn.visible = petListContainer.visible;
            titleContainer.addChild(expandAllBtn);
            addTip = function(param1:Sprite, param2:FighterInfo, petIndex:int):void
            {
               var _tip:FighterTip = new FighterTip();
               _tip.x = 30;
               _tip.y = 0;
               _tip.scaleX = 0.8;
               _tip.scaleY = 0.8;
               _tip.onExpandCallback = onTipExpandClicked;
               _tip.expandAlignLeft = petIndex >= 3;
               try
               {
                  _tip.setFighterInfo(param2);
               }
               catch(e:Error)
               {
               }
               _tips.push(_tip);
               param1.addChild(_tip);
               if(isAllExpanded && savedStates.length > petIndex)
               {
                  _tip.visible = savedStates[petIndex].visible;
                  _tip.isExpanded = savedStates[petIndex].expanded;
                  if(_tip.isExpanded)
                  {
                     expandedTipIndex = petIndex;
                  }
               }
               else if(isAllExpanded && savedStates.length <= petIndex)
               {
                  _tip.visible = true;
                  _tip.isExpanded = false;
               }
               else
               {
                  _tip.visible = false;
                  _tip.isExpanded = false;
               }
            };
            onMouseOver = function(param1:MouseEvent):void
            {
               var _loc2_:Sprite = param1.currentTarget as Sprite;
               _loc2_.scaleX = 1.1;
               _loc2_.scaleY = 1.1;
               var tipObj:FighterTip = _tips[PetDisplaySps.indexOf(_loc2_)];
               if(tipObj)
               {
                  tipObj.scaleX = 0.8 / 1.1;
                  tipObj.scaleY = 0.8 / 1.1;
               }
            };
            onMouseOut = function(param1:MouseEvent):void
            {
               var _loc2_:Sprite = param1.currentTarget as Sprite;
               _loc2_.scaleX = 1;
               _loc2_.scaleY = 1;
               var tipObj:FighterTip = _tips[PetDisplaySps.indexOf(_loc2_)];
               if(tipObj)
               {
                  tipObj.scaleX = 0.8;
                  tipObj.scaleY = 0.8;
               }
            };
            onClickTipToggle = function(param1:MouseEvent):void
            {
               var _loc2_:Sprite = param1.currentTarget as Sprite;
               var index:int = int(PetDisplaySps.indexOf(_loc2_));
               var tipObj:FighterTip = _tips[index];
               if(!tipObj)
               {
                  return;
               }
               var syncList:Vector.<FighterInfo> = getParsedList(oppositeTeam,false);
               if(expandedTipIndex == -1)
               {
                  tipObj.visible = !tipObj.visible;
                  if(tipObj.visible && syncList[index])
                  {
                     tipObj.setFighterInfo(syncList[index]);
                  }
               }
               else if(expandedTipIndex == index)
               {
                  expandedTipIndex = -1;
                  tipObj.isExpanded = false;
                  tipObj.setFighterInfo(syncList[index]);
                  tipObj.visible = false;
               }
               else
               {
                  if(_tips[expandedTipIndex] && syncList[expandedTipIndex])
                  {
                     _tips[expandedTipIndex].visible = false;
                     _tips[expandedTipIndex].isExpanded = false;
                     _tips[expandedTipIndex].setFighterInfo(syncList[expandedTipIndex]);
                  }
                  var realNewInfo:FighterInfo = syncList[index];
                  if(realNewInfo && realNewInfo.skillInfoVec && realNewInfo.skillInfoVec.length > 5)
                  {
                     expandedTipIndex = index;
                     tipObj.isExpanded = true;
                     tipObj.visible = true;
                  }
                  else
                  {
                     expandedTipIndex = -1;
                     tipObj.isExpanded = false;
                     tipObj.visible = true;
                  }
                  tipObj.setFighterInfo(realNewInfo);
               }
               var anyStillOpen:Boolean = false;
               for each(var t in _tips)
               {
                  if(t && t.visible)
                  {
                     anyStillOpen = true;
                     break;
                  }
               }
               if(!anyStillOpen)
               {
                  savedStates = [];
                  _globalOpSavedStates = [];
               }
               syncExpandAllBtn();
            };
            i = 0;
            while(i < opMaxCount)
            {
               aFighterInfo = baseList[i];
               if(aFighterInfo == null)
               {
                  _tips.push(null);
                  PetDisplays.push(null);
                  PetDisplaySps.push(null);
                  opHashes.push("");
               }
               else
               {
                  aPetDisplaySp = new Sprite();
                  aPetDisplaySp.buttonMode = true;
                  aPetDisplaySp.graphics.beginFill(0);
                  aPetDisplaySp.graphics.drawRect(0,0,120,80);
                  aPetDisplaySp.graphics.endFill();
                  aPetDisplaySp.x = 120 * i;
                  aPetDisplaySp.y = 0;
                  aPetDisplaySp.alpha = 0.8;
                  opHashes.push(getFighterHash(aFighterInfo));
                  aPetDisplay = new TextField();
                  aPetDisplay.x = 0;
                  aPetDisplay.y = 0;
                  aPetDisplay.width = 120;
                  aPetDisplay.height = 80;
                  aPetDisplay.multiline = true;
                  aPetDisplay.wordWrap = true;
                  aPetDisplay.alpha = 0.8;
                  aPetDisplay.mouseEnabled = false;
                  aPetDisplay.defaultTextFormat = myFont;
                  addTip(aPetDisplaySp,aFighterInfo,i);
                  aPetDisplaySp.addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
                  aPetDisplaySp.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
                  aPetDisplaySp.addEventListener(MouseEvent.CLICK,onClickTipToggle);
                  this.PetDisplays.push(aPetDisplay);
                  this.PetDisplaySps.push(aPetDisplaySp);
                  aPetDisplaySp.addChild(aPetDisplay);
                  this.petListContainer.addChild(aPetDisplaySp);
               }
               i++;
            }
            updateOpponentTeam(rightTeam);
            syncExpandAllBtn();
         }
         catch(e:Error)
         {
         }
      }
      
      private function initMyTeam(leftTeam:FighterTeam) : void
      {
         var baseList:Vector.<FighterInfo>;
         var myMaxCount:int;
         var addTip:Function;
         var onMouseOver:Function;
         var onMouseOut:Function;
         var onClickTipToggle:Function;
         var i:int;
         var aFighterInfo:FighterInfo;
         var aPetDisplaySp:Sprite;
         var aPetDisplay:TextField;
         try
         {
            DisplayObjectUtil.removeAllChildren(myTitleContainer);
            DisplayObjectUtil.removeAllChildren(myPetListContainer);
            this.myPetDisplays = new Vector.<TextField>();
            this.myPetDisplaySps = new Vector.<Sprite>();
            this._myTips = new Vector.<FighterTip>();
            this.myHashes = [];
            if(_globalMySavedStates.length == 0)
            {
               this.mySavedStates = [];
            }
            this.myDeadSlots = [false,false,false,false,false,false];
            this.myTeam = leftTeam;
            this.lastMyMainInfo = null;
            baseList = getParsedList(leftTeam,true);
            myMaxCount = int(baseList.length);
            myTitleContainer.graphics.clear();
            myTitleContainer.graphics.beginFill(0,0.8);
            myTitleContainer.graphics.drawRect(0,0,110,80);
            myTitleContainer.graphics.endFill();
            myTitleContainer.x = -110;
            myTitleContainer.y = 0;
            myBtnListToggle = new Sprite();
            myBtnListToggle.buttonMode = true;
            myBtnListToggle.graphics.beginFill(0,0);
            myBtnListToggle.graphics.drawRect(0,0,110,40);
            myBtnListToggle.graphics.endFill();
            myBtnListToggle.addEventListener(MouseEvent.CLICK,myTogglePetList);
            myTitleDisplayTxt = new TextField();
            myTitleDisplayTxt.x = 0;
            myTitleDisplayTxt.y = 6;
            myTitleDisplayTxt.width = 110;
            myTitleDisplayTxt.height = 30;
            myTitleDisplayTxt.defaultTextFormat = myFont;
            myTitleDisplayTxt.text = "";
            myTitleDisplayTxt.mouseEnabled = false;
            myBtnListToggle.addChild(myTitleDisplayTxt);
            myTitleContainer.addChild(myBtnListToggle);
            myExpandAllBtn = new Sprite();
            myExpandAllBtn.buttonMode = true;
            myExpandAllBtn.y = 40;
            myExpandAllBtn.graphics.beginFill(0,0);
            myExpandAllBtn.graphics.drawRect(0,0,110,40);
            myExpandAllBtn.graphics.endFill();
            myExpandAllBtn.addEventListener(MouseEvent.CLICK,myOnExpandAllClick);
            myExpandAllTxt = new TextField();
            myExpandAllTxt.x = 0;
            myExpandAllTxt.y = 6;
            myExpandAllTxt.width = 110;
            myExpandAllTxt.height = 30;
            myExpandAllTxt.defaultTextFormat = myFont;
            myExpandAllTxt.text = "";
            myExpandAllTxt.mouseEnabled = false;
            myExpandAllBtn.addChild(myExpandAllTxt);
            myExpandAllBtn.visible = false;
            myTitleContainer.addChild(myExpandAllBtn);
            addTip = function(param1:Sprite, param2:FighterInfo, petIndex:int):void
            {
               var _tip:FighterTip = new FighterTip();
               _tip.x = 30;
               _tip.y = 0;
               _tip.scaleX = 0.8;
               _tip.scaleY = 0.8;
               _tip.onExpandCallback = myOnTipExpandClicked;
               _tip.expandAlignLeft = petIndex % 5 >= 3;
               try
               {
                  _tip.setFighterInfo(param2);
               }
               catch(e:Error)
               {
               }
               _myTips.push(_tip);
               param1.addChild(_tip);
               if(myIsAllExpanded && mySavedStates.length > petIndex)
               {
                  _tip.visible = mySavedStates[petIndex].visible;
                  _tip.isExpanded = mySavedStates[petIndex].expanded;
                  if(_tip.isExpanded)
                  {
                     myExpandedTipIndex = petIndex;
                  }
               }
               else if(myIsAllExpanded && mySavedStates.length <= petIndex)
               {
                  _tip.visible = true;
                  _tip.isExpanded = false;
               }
               else
               {
                  _tip.visible = false;
                  _tip.isExpanded = false;
               }
            };
            onMouseOver = function(param1:MouseEvent):void
            {
               var _loc2_:Sprite = param1.currentTarget as Sprite;
               _loc2_.scaleX = 1.1;
               _loc2_.scaleY = 1.1;
               var tipObj:FighterTip = _myTips[myPetDisplaySps.indexOf(_loc2_)];
               if(tipObj)
               {
                  tipObj.scaleX = 0.8 / 1.1;
                  tipObj.scaleY = 0.8 / 1.1;
               }
            };
            onMouseOut = function(param1:MouseEvent):void
            {
               var _loc2_:Sprite = param1.currentTarget as Sprite;
               _loc2_.scaleX = 1;
               _loc2_.scaleY = 1;
               var tipObj:FighterTip = _myTips[myPetDisplaySps.indexOf(_loc2_)];
               if(tipObj)
               {
                  tipObj.scaleX = 0.8;
                  tipObj.scaleY = 0.8;
               }
            };
            onClickTipToggle = function(param1:MouseEvent):void
            {
               var _loc2_:Sprite = param1.currentTarget as Sprite;
               var index:int = int(myPetDisplaySps.indexOf(_loc2_));
               var tipObj:FighterTip = _myTips[index];
               if(!tipObj)
               {
                  return;
               }
               var syncList:Vector.<FighterInfo> = getParsedList(myTeam,true);
               if(myExpandedTipIndex == -1)
               {
                  tipObj.visible = !tipObj.visible;
                  if(tipObj.visible && syncList[index])
                  {
                     tipObj.setFighterInfo(syncList[index]);
                  }
               }
               else if(myExpandedTipIndex == index)
               {
                  myExpandedTipIndex = -1;
                  tipObj.isExpanded = false;
                  tipObj.setFighterInfo(syncList[index]);
                  tipObj.visible = false;
               }
               else
               {
                  if(_myTips[myExpandedTipIndex] && syncList[myExpandedTipIndex])
                  {
                     _myTips[myExpandedTipIndex].visible = false;
                     _myTips[myExpandedTipIndex].isExpanded = false;
                     _myTips[myExpandedTipIndex].setFighterInfo(syncList[myExpandedTipIndex]);
                  }
                  var realNewInfo:FighterInfo = syncList[index];
                  if(realNewInfo && realNewInfo.skillInfoVec && realNewInfo.skillInfoVec.length > 5)
                  {
                     myExpandedTipIndex = index;
                     tipObj.isExpanded = true;
                     tipObj.visible = true;
                  }
                  else
                  {
                     myExpandedTipIndex = -1;
                     tipObj.isExpanded = false;
                     tipObj.visible = true;
                  }
                  tipObj.setFighterInfo(realNewInfo);
               }
               var anyStillOpen:Boolean = false;
               for each(var t in _myTips)
               {
                  if(t && t.visible)
                  {
                     anyStillOpen = true;
                     break;
                  }
               }
               if(!anyStillOpen)
               {
                  mySavedStates = [];
                  _globalMySavedStates = [];
               }
               mySyncExpandAllBtn();
            };
            i = 0;
            while(i < myMaxCount)
            {
               aFighterInfo = baseList[i];
               if(aFighterInfo == null)
               {
                  _myTips.push(null);
                  myPetDisplays.push(null);
                  myPetDisplaySps.push(null);
                  myHashes.push("");
               }
               else
               {
                  aPetDisplaySp = new Sprite();
                  aPetDisplaySp.buttonMode = true;
                  aPetDisplaySp.graphics.beginFill(0);
                  aPetDisplaySp.graphics.drawRect(0,0,120,80);
                  aPetDisplaySp.graphics.endFill();
                  aPetDisplaySp.x = 120 * i;
                  aPetDisplaySp.y = 0;
                  aPetDisplaySp.alpha = 0.8;
                  myHashes.push(getFighterHash(aFighterInfo));
                  aPetDisplay = new TextField();
                  aPetDisplay.x = 0;
                  aPetDisplay.y = 0;
                  aPetDisplay.width = 120;
                  aPetDisplay.height = 80;
                  aPetDisplay.multiline = true;
                  aPetDisplay.wordWrap = true;
                  aPetDisplay.alpha = 0.8;
                  aPetDisplay.mouseEnabled = false;
                  aPetDisplay.defaultTextFormat = myFont;
                  addTip(aPetDisplaySp,aFighterInfo,i);
                  aPetDisplaySp.addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
                  aPetDisplaySp.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
                  aPetDisplaySp.addEventListener(MouseEvent.CLICK,onClickTipToggle);
                  this.myPetDisplays.push(aPetDisplay);
                  this.myPetDisplaySps.push(aPetDisplaySp);
                  aPetDisplaySp.addChild(aPetDisplay);
                  this.myPetListContainer.addChild(aPetDisplaySp);
               }
               i++;
            }
            updateMyTeam(leftTeam);
            mySyncExpandAllBtn();
         }
         catch(e:Error)
         {
         }
      }
      
      public function updatePetDisplay(rightTeam:FighterTeam) : void
      {
         var liveRightTeam:FighterTeam;
         var opLen:int;
         var myLen:int;
         try
         {
            liveRightTeam = rightTeam;
            if(this._scene && this._scene.rightTeam != null)
            {
               liveRightTeam = this._scene.rightTeam;
            }
            if(liveRightTeam != null && liveRightTeam.fighterVec != null)
            {
               opLen = Math.min(6,liveRightTeam.fighterVec.length);
               if(this.PetDisplays == null || this.PetDisplays.length == 0 || opLen > this.PetDisplays.length)
               {
                  initOpponentTeam(liveRightTeam);
               }
               else
               {
                  updateOpponentTeam(liveRightTeam);
               }
            }
            if(this._scene && this._scene.leftTeam != null && this._scene.leftTeam.fighterVec != null)
            {
               myLen = Math.min(6,this._scene.leftTeam.fighterVec.length);
               if(this.myPetDisplays == null || this.myPetDisplays.length == 0 || myLen > this.myPetDisplays.length)
               {
                  initMyTeam(this._scene.leftTeam);
               }
               else
               {
                  updateMyTeam(this._scene.leftTeam);
               }
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function updateOpponentTeam(rightTeam:FighterTeam) : void
      {
         var list:Vector.<FighterInfo>;
         var _loc2_:int;
         var realInfo:FighterInfo;
         var pName:String;
         var pLevel:String;
         var pHp:String;
         var pMaxHp:String;
         var newText:String;
         var currentHash:String;
         try
         {
            this.oppositeTeam = rightTeam;
            list = getParsedList(rightTeam,false);
            _loc2_ = 0;
            while(_loc2_ < list.length)
            {
               realInfo = list[_loc2_];
               if(!(realInfo == null || this.PetDisplays.length <= _loc2_ || this.PetDisplays[_loc2_] == null))
               {
                  pName = "未知";
                  try
                  {
                     if(realInfo.hasOwnProperty("name") && realInfo.name && realInfo.name != "")
                     {
                        pName = realInfo.name;
                     }
                  }
                  catch(e1:Error)
                  {
                  }
                  pLevel = "?";
                  try
                  {
                     pLevel = realInfo["level"];
                  }
                  catch(e3:Error)
                  {
                  }
                  pHp = "?";
                  try
                  {
                     if(this.opDeadSlots[_loc2_])
                     {
                        pHp = "0";
                     }
                     else
                     {
                        pHp = realInfo["hp"];
                     }
                  }
                  catch(e4:Error)
                  {
                  }
                  pMaxHp = "?";
                  try
                  {
                     pMaxHp = realInfo["maxHp"];
                  }
                  catch(e5:Error)
                  {
                  }
                  newText = "Lv" + pLevel + " " + pName + "\n" + pHp + "/" + pMaxHp;
                  if(this.PetDisplays[_loc2_].text != newText)
                  {
                     this.PetDisplays[_loc2_].text = newText;
                  }
                  currentHash = getFighterHash(realInfo);
                  if(this.opHashes.length > _loc2_ && this.opHashes[_loc2_] != currentHash)
                  {
                     this.opHashes[_loc2_] = currentHash;
                     if(this._tips.length > _loc2_ && this._tips[_loc2_] && this._tips[_loc2_].visible)
                     {
                        this._tips[_loc2_].setFighterInfo(realInfo);
                     }
                  }
               }
               _loc2_++;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function updateMyTeam(leftTeam:FighterTeam) : void
      {
         var list:Vector.<FighterInfo>;
         var _loc2_:int;
         var realInfo:FighterInfo;
         var pName:String;
         var pLevel:String;
         var pHp:String;
         var pMaxHp:String;
         var newText:String;
         var myCurrentHash:String;
         try
         {
            this.myTeam = leftTeam;
            if(this.myPetDisplay)
            {
               this.myPetDisplay.visible = false;
            }
            list = getParsedList(leftTeam,true);
            _loc2_ = 0;
            while(_loc2_ < list.length)
            {
               realInfo = list[_loc2_];
               if(!(realInfo == null || this.myPetDisplays.length <= _loc2_ || this.myPetDisplays[_loc2_] == null))
               {
                  pName = "未知";
                  try
                  {
                     if(realInfo.hasOwnProperty("name") && realInfo.name && realInfo.name != "")
                     {
                        pName = realInfo.name;
                     }
                  }
                  catch(e1:Error)
                  {
                  }
                  pLevel = "?";
                  try
                  {
                     pLevel = realInfo["level"];
                  }
                  catch(e3:Error)
                  {
                  }
                  pHp = "?";
                  try
                  {
                     if(this.myDeadSlots[_loc2_])
                     {
                        pHp = "0";
                     }
                     else
                     {
                        pHp = realInfo["hp"];
                     }
                  }
                  catch(e4:Error)
                  {
                  }
                  pMaxHp = "?";
                  try
                  {
                     pMaxHp = realInfo["maxHp"];
                  }
                  catch(e5:Error)
                  {
                  }
                  newText = "Lv" + pLevel + " " + pName + "\n" + pHp + "/" + pMaxHp;
                  if(this.myPetDisplays[_loc2_].text != newText)
                  {
                     this.myPetDisplays[_loc2_].text = newText;
                  }
                  myCurrentHash = getFighterHash(realInfo);
                  if(this.myHashes.length > _loc2_ && this.myHashes[_loc2_] != myCurrentHash)
                  {
                     this.myHashes[_loc2_] = myCurrentHash;
                     if(this._myTips.length > _loc2_ && this._myTips[_loc2_] && this._myTips[_loc2_].visible)
                     {
                        this._myTips[_loc2_].setFighterInfo(realInfo);
                     }
                  }
               }
               _loc2_++;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function dispose() : void
      {
         try
         {
            if(this.btnListToggle)
            {
               this.btnListToggle.removeEventListener(MouseEvent.CLICK,togglePetList);
               this.btnListToggle = null;
            }
            if(this.expandAllBtn)
            {
               this.expandAllBtn.removeEventListener(MouseEvent.CLICK,onExpandAllClick);
               this.expandAllBtn = null;
               this.expandAllTxt = null;
            }
            if(this.titleContainer)
            {
               DisplayObjectUtil.removeFromParent(this.titleContainer);
               DisplayObjectUtil.removeAllChildren(this.titleContainer);
            }
            if(this.petListContainer)
            {
               DisplayObjectUtil.removeFromParent(this.petListContainer);
               DisplayObjectUtil.removeAllChildren(this.petListContainer);
            }
            if(this.opPetDisplay)
            {
               this.opPetDisplay.removeEventListener(MouseEvent.ROLL_OVER,bringToFront);
               this.opPetDisplay.removeEventListener(MouseEvent.ROLL_OUT,sendToBack);
            }
            DisplayObjectUtil.removeFromParent(this.opPetDisplay);
            DisplayObjectUtil.removeAllChildren(this.opPetDisplay);
            if(this.myBtnListToggle)
            {
               this.myBtnListToggle.removeEventListener(MouseEvent.CLICK,myTogglePetList);
               this.myBtnListToggle = null;
            }
            if(this.myExpandAllBtn)
            {
               this.myExpandAllBtn.removeEventListener(MouseEvent.CLICK,myOnExpandAllClick);
               this.myExpandAllBtn = null;
               this.myExpandAllTxt = null;
            }
            if(this.myTitleContainer)
            {
               DisplayObjectUtil.removeFromParent(this.myTitleContainer);
               DisplayObjectUtil.removeAllChildren(this.myTitleContainer);
            }
            if(this.myPetListContainer)
            {
               DisplayObjectUtil.removeFromParent(this.myPetListContainer);
               DisplayObjectUtil.removeAllChildren(this.myPetListContainer);
            }
            if(this.myPetDisplay)
            {
               this.myPetDisplay.removeEventListener(MouseEvent.ROLL_OVER,bringToFront);
               this.myPetDisplay.removeEventListener(MouseEvent.ROLL_OUT,sendToBack);
            }
            DisplayObjectUtil.removeFromParent(this.myPetDisplay);
            DisplayObjectUtil.removeAllChildren(this.myPetDisplay);
            if(this.DisplayController)
            {
               this.DisplayController.removeEventListener(MouseEvent.ROLL_OVER,bringToFront);
               this.DisplayController.removeEventListener(MouseEvent.ROLL_OUT,sendToBack);
               this.DisplayController.removeEventListener(MouseEvent.CLICK,this.controlPanel);
            }
            DisplayObjectUtil.removeFromParent(this.DisplayController);
            DisplayObjectUtil.removeAllChildren(this.DisplayController);
            this.titleContainer = null;
            this.petListContainer = null;
            this.titleDisplayTxt = null;
            this.opPetDisplay = null;
            this.oppositeTeam = null;
            this.PetDisplays = null;
            this.PetDisplaySps = null;
            this._tips = null;
            this.savedStates = null;
            this.opHashes = null;
            this.opDeadSlots = null;
            this.lastOpMainInfo = null;
            this.myTitleContainer = null;
            this.myPetListContainer = null;
            this.myTitleDisplayTxt = null;
            this.myPetDisplay = null;
            this.myTeam = null;
            this.myPetDisplays = null;
            this.myPetDisplaySps = null;
            this._myTips = null;
            this.mySavedStates = null;
            this.myHashes = null;
            this.myDeadSlots = null;
            this.lastMyMainInfo = null;
            this.DisplayController = null;
            this.myFont = null;
            this._contentValue = null;
            this._scene = null;
         }
         catch(e:Error)
         {
         }
      }
   }
}

