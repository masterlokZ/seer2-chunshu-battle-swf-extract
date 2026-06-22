package seer2.next.fight.ui
{
   import com.taomee.seer2.app.arena.resource.FightUIManager;
   import com.taomee.seer2.app.net.CommandSet;
   import com.taomee.seer2.app.net.Connection;
   import com.taomee.seer2.core.effects.SoundEffects;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import seer2.next.fight.auto.AutoFightPanel;
   import seer2.next.fight.ui.data.ArenaData;
   import seer2.next.fight.ui.data.PetData;
   
   public class FightUIExt extends Sprite
   {
      
      public static var isDeposit:Boolean = false;
      
      public static var callbackWhenDepositBtn:Function;
      
      private var _depositTxtMc:MovieClip;
      
      private var _deposite:MovieClip;
      
      public function FightUIExt()
      {
         super();
         createDepositBtn();
      }
      
      public static function fish(_arenaData:ArenaData) : void
      {
         var skillOp:* = function(skillIndex:int):void
         {
            var skillId:int = 0;
            var j:int = 0;
            if(_arenaData.left.master.hp > 0)
            {
               skillId = _arenaData.left.master.skills[skillIndex].id;
               Connection.send(CommandSet.FIGHT_USE_SKILL_1502,skillId);
               return;
            }
            var pid:int = 0;
            var pets:Vector.<PetData> = _arenaData.left.pets;
            for(j = 0; j < pets.length; )
            {
               if(pets[j].hp > 0)
               {
                  pid = pets[j].pid;
                  break;
               }
               j++;
            }
            if(pid != 0)
            {
               Connection.send(CommandSet.FIGHT_CHANGE_FIGHTER_1032,pid);
            }
         };
         var runOp:* = function():void
         {
            Connection.send(CommandSet.FIGHT_ESCAPE_1509);
         };
         var cure:* = function():void
         {
            Connection.send(CommandSet.FIGHT_USE_MEDICINE_1048,_arenaData.left.master.pid,200019,1);
         };
         var capture:* = function():void
         {
            Connection.send(CommandSet.FIGHT_CATCH_PET_1031,200003);
         };
         var angerSupplement:* = function(param:uint):void
         {
            Connection.send(CommandSet.FIGHT_USE_MEDICINE_1048,_arenaData.left.master.pid,200000 + param,1);
         };
         var changeOp:* = function(petIndex:int):void
         {
            var o:PetData = _arenaData.left.pets[petIndex - 11];
            if(o.position != 0)
            {
               skillOp(0);
            }
            else if(o.hp > 0)
            {
               Connection.send(CommandSet.FIGHT_CHANGE_FIGHTER_1032,o.pid);
            }
            else if(o.hp == 0)
            {
               Connection.send(CommandSet.FIGHT_USE_MEDICINE_1048,o.pid,200064,1);
            }
         };
         var op:int = AutoFightPanel.instance().getOperation();
         if(op < 6)
         {
            skillOp(op);
         }
         else if(op == 6)
         {
            runOp();
         }
         else if(op == 7)
         {
            cure();
         }
         else if(op == 8)
         {
            capture();
         }
         else if(op > 20 && op < 30)
         {
            angerSupplement(op);
         }
         else if(op > 10 && op < 20)
         {
            changeOp(op);
         }
      }
      
      public function createDepositBtn() : void
      {
         this._deposite = FightUIManager.getMovieClip("New_UI_DepositBtn");
         this._deposite.y = 385;
         this._deposite.x = 1140;
         this._deposite.buttonMode = true;
         isDeposit = false;
         this._deposite.addEventListener("click",this.onDeposite);
         addChild(this._deposite);
         this._deposite.gotoAndStop(1);
         this._depositTxtMc = FightUIManager.getMovieClip("New_UI_DepositTxt");
         this._depositTxtMc.x = 490;
         this._depositTxtMc.y = 125;
         this._depositTxtMc.visible = false;
         addChild(this._depositTxtMc);
      }
      
      private function onDeposite(param1:MouseEvent) : void
      {
         if((param1.currentTarget as MovieClip).currentFrame <= 2)
         {
            isDeposit = true;
            (param1.currentTarget as MovieClip).gotoAndStop(3);
            this._depositTxtMc.visible = true;
            if(Boolean(FightUIExt.callbackWhenDepositBtn))
            {
               FightUIExt.callbackWhenDepositBtn();
            }
         }
         else if((param1.currentTarget as MovieClip).currentFrame == 3)
         {
            isDeposit = false;
            (param1.currentTarget as MovieClip).gotoAndStop(1);
            this._depositTxtMc.visible = false;
         }
         SoundEffects.playSoundMouseClick(0.35);
      }
   }
}

