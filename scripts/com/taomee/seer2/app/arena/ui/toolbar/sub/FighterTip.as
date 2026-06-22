package com.taomee.seer2.app.arena.ui.toolbar.sub
{
   import com.taomee.seer2.app.arena.data.FighterInfo;
   import com.taomee.seer2.app.arena.resource.FightUIManager;
   import com.taomee.seer2.app.pet.data.SkillInfo;
   import com.taomee.seer2.core.scene.LayerManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class FighterTip extends Sprite
   {
      
      private static const ITEM_HEIGHT:int = 54;
      
      private static const MAX_ROWS:int = 6;
      
      private var _back:Sprite;
      
      private var _itemVec:Vector.<MovieClip>;
      
      private var _detailTip:Sprite;
      
      private var _detailTxt:TextField;
      
      public var isExpanded:Boolean = false;
      
      public var expandAlignLeft:Boolean = false;
      
      public var onExpandCallback:Function;
      
      private var _skillInfoVec:Vector.<SkillInfo>;
      
      private var _expandBtn:Sprite;
      
      private var _expandBtnTxt:TextField;
      
      public function FighterTip()
      {
         super();
         this.initialize();
      }
      
      private function initialize() : void
      {
         this.mouseChildren = true;
         this.mouseEnabled = false;
         this.createChildren();
         this.createDetailTip();
         this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
      }
      
      private function createDetailTip() : void
      {
         _detailTip = new Sprite();
         _detailTip.mouseEnabled = false;
         _detailTip.mouseChildren = false;
         _detailTxt = new TextField();
         _detailTxt.width = 240;
         _detailTxt.multiline = true;
         _detailTxt.wordWrap = true;
         _detailTxt.autoSize = TextFieldAutoSize.LEFT;
         var tf:TextFormat = new TextFormat();
         tf.size = 14;
         tf.color = 16777215;
         tf.leading = 4;
         _detailTxt.defaultTextFormat = tf;
         _detailTip.addChild(_detailTxt);
      }
      
      private function createChildren() : void
      {
         this.createBack();
         this._itemVec = new Vector.<MovieClip>();
         _expandBtn = new Sprite();
         _expandBtn.buttonMode = true;
         _expandBtn.addEventListener(MouseEvent.CLICK,onExpandClick);
         _expandBtnTxt = new TextField();
         _expandBtnTxt.width = 60;
         _expandBtnTxt.height = 18;
         _expandBtnTxt.mouseEnabled = false;
         _expandBtnTxt.y = 1;
         var fmt:TextFormat = new TextFormat();
         fmt.color = 65535;
         fmt.size = 12;
         fmt.align = "center";
         _expandBtnTxt.defaultTextFormat = fmt;
         _expandBtn.addChild(_expandBtnTxt);
         addChild(_expandBtn);
      }
      
      private function onExpandClick(e:MouseEvent) : void
      {
         e.stopPropagation();
         if(onExpandCallback != null)
         {
            onExpandCallback(this);
         }
      }
      
      private function createBack() : void
      {
         this._back = FightUIManager.getSprite("UI_FightPetTipBack");
         addChild(this._back);
      }
      
      public function setFighterInfo(param1:FighterInfo) : void
      {
         this._skillInfoVec = param1.skillInfoVec;
         this.updateSkillConent();
      }
      
      private function updateSkillConent() : void
      {
         this.resetSkillContent();
         if(this._skillInfoVec == null)
         {
            return;
         }
         var totalSkills:int = int(this._skillInfoVec.length);
         var displayCount:int = this.isExpanded ? totalSkills : Math.min(5,totalSkills);
         while(this._itemVec.length < displayCount)
         {
            var _loc3_:MovieClip = FightUIManager.getMovieClip("UI_FightPeTipItem");
            _loc3_.mouseChildren = false;
            _loc3_.buttonMode = true;
            this._itemVec.push(_loc3_);
            addChild(_loc3_);
         }
         var rows:int = Math.min(displayCount,MAX_ROWS);
         var cols:int = Math.ceil(displayCount / MAX_ROWS);
         if(cols == 0)
         {
            cols = 1;
         }
         var bottomMargin:int = totalSkills > 5 ? 24 : 0;
         this._back.height = 54 * rows + 30 + bottomMargin;
         var boxWidth:int = 125 * cols + 10;
         this._back.width = boxWidth;
         this._back.x = this.expandAlignLeft ? -(boxWidth - 135) : 0;
         var i:int = 0;
         while(i < displayCount)
         {
            if(this._itemVec[i] != null)
            {
               var r:int = i % MAX_ROWS;
               var c:int = int(i / MAX_ROWS);
               this._itemVec[i].x = this._back.x + 6 + c * 125;
               this._itemVec[i].y = -1 * this._back.height + r * 54 + 10;
               this.showSkillItem(this._itemVec[i],this._skillInfoVec[i]);
            }
            i++;
         }
         if(totalSkills > 5)
         {
            _expandBtn.visible = true;
            _expandBtnTxt.text = this.isExpanded ? "收起 ▲" : (this.expandAlignLeft ? "展开 ◄" : "展开 ►");
            _expandBtn.graphics.clear();
            _expandBtn.graphics.beginFill(2236962,0.9);
            _expandBtn.graphics.lineStyle(1,65535,0.6);
            _expandBtn.graphics.drawRoundRect(0,0,60,20,5,5);
            _expandBtn.graphics.endFill();
            _expandBtn.x = this._back.x + (135 - 60) / 2;
            _expandBtn.y = -26;
         }
         else
         {
            _expandBtn.visible = false;
         }
      }
      
      private function showSkillItem(param1:MovieClip, param2:SkillInfo) : void
      {
         var _loc7_:TextField = param1["nameTxt"];
         var _loc6_:TextField = param1["powerTxt"];
         var _loc4_:TextField = param1["powerValueTxt"];
         var _loc3_:TextField = param1["angerTxt"];
         var _loc5_:TextField = param1["angerValueTxt"];
         _loc7_.text = param2.name;
         _loc6_.multiline = true;
         _loc6_.wordWrap = true;
         _loc6_.autoSize = TextFieldAutoSize.LEFT;
         _loc6_.width = 95;
         _loc6_.text = "威力:" + param2.power.toString() + "\n怒气:" + param2.anger.toString();
         _loc4_.visible = false;
         _loc3_.visible = false;
         _loc5_.visible = false;
         param1["skillData"] = param2;
         param1.addEventListener(MouseEvent.ROLL_OVER,onSkillOver);
         param1.addEventListener(MouseEvent.ROLL_OUT,onSkillOut);
         param1.visible = true;
      }
      
      private function onSkillOver(e:MouseEvent) : void
      {
         var skillName:String;
         var desc:String;
         var pt:Point;
         var mc:MovieClip = e.currentTarget as MovieClip;
         var skill:SkillInfo = mc["skillData"] as SkillInfo;
         if(skill != null)
         {
            skillName = "<font color=\'#00FFFF\' size=\'18\'><b>" + skill.name + "</b></font>\n";
            desc = "暂无描述";
            try
            {
               if(skill.description)
               {
                  desc = skill.description;
               }
            }
            catch(err:Error)
            {
            }
            _detailTxt.htmlText = skillName + desc;
            _detailTip.graphics.clear();
            _detailTip.graphics.beginFill(0,0.9);
            _detailTip.graphics.lineStyle(1.5,65535,0.8);
            _detailTip.graphics.drawRoundRect(-8,-8,_detailTxt.width + 16,_detailTxt.height + 16,8,8);
            _detailTip.graphics.endFill();
            pt = mc.localToGlobal(new Point(0,0));
            _detailTip.x = pt.x - (_detailTip.width + 10);
            _detailTip.y = pt.y;
            LayerManager.uiLayer.addChild(_detailTip);
         }
      }
      
      private function onSkillOut(e:MouseEvent) : void
      {
         if(_detailTip && LayerManager.uiLayer.contains(_detailTip))
         {
            LayerManager.uiLayer.removeChild(_detailTip);
         }
      }
      
      private function resetSkillContent() : void
      {
         if(_detailTip && LayerManager.uiLayer && LayerManager.uiLayer.contains(_detailTip))
         {
            LayerManager.uiLayer.removeChild(_detailTip);
         }
         for each(var _loc1_ in this._itemVec)
         {
            _loc1_.visible = false;
            _loc1_.removeEventListener(MouseEvent.ROLL_OVER,onSkillOver);
            _loc1_.removeEventListener(MouseEvent.ROLL_OUT,onSkillOut);
         }
      }
      
      private function onRemoveFromStage(e:Event) : void
      {
         if(_detailTip && LayerManager.uiLayer && LayerManager.uiLayer.contains(_detailTip))
         {
            LayerManager.uiLayer.removeChild(_detailTip);
         }
      }
   }
}

