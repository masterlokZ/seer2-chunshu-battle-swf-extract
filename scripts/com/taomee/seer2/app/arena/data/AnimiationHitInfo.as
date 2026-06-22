package com.taomee.seer2.app.arena.data
{
   import com.taomee.seer2.app.arena.util.FighterActionType;
   
   public class AnimiationHitInfo
   {
      
      public var id:uint;
      
      public var physics:uint;
      
      public var attribute:uint;
      
      public var special:uint;
      
      public var critical:uint;
      
      public var fit:uint;
      
      public var physicsArray:Array;
      
      public var attributeArray:Array;
      
      public var specialArray:Array;
      
      public var criticalArray:Array;
      
      public var fitArray:Array;
      
      public var hasArray:Boolean;
      
      public function AnimiationHitInfo()
      {
         super();
      }
      
      public function getHitValue(param1:String) : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case FighterActionType.ATK_PHY:
               _loc2_ = int(this.physics);
               break;
            case FighterActionType.ATK_BUF:
               _loc2_ = int(this.attribute);
               break;
            case FighterActionType.ATK_SPE:
               _loc2_ = int(this.special);
               break;
            case FighterActionType.ATK_POW:
               _loc2_ = int(this.critical);
               break;
            case FighterActionType.INTERCOURSE:
               _loc2_ = int(this.fit);
         }
         return int(_loc2_ / 1.07);
      }
      
      public function getHitArray(param1:String) : Array
      {
         if(!hasArray)
         {
            return [getHitValue(param1)];
         }
         switch(param1)
         {
            case FighterActionType.ATK_PHY:
               var _loc2_:Array = this.physicsArray;
               break;
            case FighterActionType.ATK_BUF:
               _loc2_ = this.attributeArray;
               break;
            case FighterActionType.ATK_SPE:
               _loc2_ = this.specialArray;
               break;
            case FighterActionType.ATK_POW:
               _loc2_ = this.criticalArray;
               break;
            case FighterActionType.INTERCOURSE:
               _loc2_ = this.fitArray;
         }
         return _loc2_;
      }
   }
}

