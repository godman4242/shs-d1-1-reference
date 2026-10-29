package
{
   import flash.display.MovieClip;
   
   public class MCSActor
   {
      
      internal static var IDLE_SHEATHED:String = "idle";
      
      internal static var SHEATHESWORD:String = "sheathesword";
      
      internal static var SHEATHESWORDCHIBURI:String = "sheathesword3";
      
      internal static var SHEATHETOIDLE:String = "sheathetoidle";
      
      internal static var IDLE2:String = "idle2";
      
      internal static var WALK_SHEATHED:String = "walk";
      
      internal static var RUN_SHEATHED:String = "run_sheathed";
      
      internal static var BRAKE:String = "brake";
      
      internal static var JUMPUNSHEATHED_RISE:String = "jumpunsheathed_parta";
      
      internal static var JUMPUNSHEATHED_PEAK:String = "jumpunsheathed_partb";
      
      internal static var JUMPUNSHEATHED_FALL:String = "jumpunsheathed_partc";
      
      internal static var JUMPSHEATHED_RISE:String = "jumpsheathed_parta";
      
      internal static var JUMPSHEATHED_PEAK:String = "jumpsheathed_partb";
      
      internal static var JUMPSHEATHED_FALL:String = "jumpsheathed_partc";
      
      internal static var DEFEATED1:String = "defeatedanimationv1";
      
      internal static var DEFEATED2:String = "defeatedanimationv2";
      
      internal static var DEATH_FORWARD:String = "death";
      
      internal static var DOWNED:String = "downed";
      
      internal static var GOTLAUNCHEDDOWNED:String = "gotlauncheddowned";
      
      internal static var GOTLAUNCHEDDOWNEDEND:String = "gotlauncheddownedend";
      
      internal static var DOWNEDUP:String = "downedup";
      
      internal static var DOWNEDUP2:String = "downedup2";
      
      internal static var DEATHARROW:String = "deathbyarrow";
      
      internal static var FLY_START:String = "fly_start";
      
      internal static var FLY_END:String = "fly_end";
      
      internal static var GETUP_FRONT:String = "getup_front";
      
      internal static var LAUNCH:String = "launchopponent";
      
      internal static var DOWNSTAB:String = "downstab";
      
      internal static var DOWNSTAB_UP:String = "downstab_up";
      
      internal static var FLIPUP:String = "flipupfromdowned";
      
      internal static var BACKSTEP_START:String = "backstep_start";
      
      internal static var BACKSTEP_END:String = "backstep_end";
      
      internal static var DASH_START:String = "dash_start";
      
      internal static var DASH_END:String = "dash_end";
      
      internal static var ARROWPULLBACKFULL:String = "pullbackarrow_full";
      
      internal static var PICKUP:String = "crouchpickupstand";
      
      internal static var KNEEL:String = "kneel";
      
      internal static var THROWGRENADE:String = "throwgrenade";
      
      internal static var PUNCH:String = "punch";
      
      internal static var FORWARDROLL_START:String = "forwardroll_start";
      
      internal static var FORWARDROLL_END:String = "forwardroll_end";
      
      internal static var SHEATHEDJUMP:String = "sheathedjump";
      
      internal static var SHEATHEDLAND:String = "sheathedland";
      
      internal static var KUNAITHROW:String = "kunaithrow";
      
      internal static var GANGNAM:String = "gangnam";
      
      internal static var SIT:String = "sit";
      
      internal static var SIT2:String = "sit2";
      
      internal static var SIT3:String = "sit3";
      
      internal static var LIEDOWN:String = "liedown";
      
      internal static var SEPPUKU_START:String = "seppuku_start";
      
      internal static var SEPPUKU_MID:String = "seppuku_mid";
      
      internal static var SEPPUKU_END:String = "seppuku_end";
      
      internal static var SEPPUKU_NOHEAD:String = "seppuku_nohead";
      
      internal static var MINING:String = "mining";
      
      internal static var TIRED:String = "tired";
      
      internal static var TIREDNOSWORD:String = "tired_nosword";
      
      internal static var BOW:String = "japanesebow";
      
      internal static var BOW2:String = "japanesebow2";
      
      internal static var SHOULDERWEAPON:String = "shoulderweapon";
      
      internal static var MOUNTED_IDLE:String = "mounted_idle";
      
      internal static var MOUNTED_WALK:String = "mounted_walk";
      
      internal static var MOUNTED_RUN:String = "mounted_run";
      
      internal static var POSE1:String = "nodepose_1";
      
      internal static var POSE2:String = "nodepose_2";
      
      internal static var POSE3:String = "nodepose_3";
      
      internal static var POSE4:String = "nodepose_4";
      
      internal static var POSE5:String = "nodepose_5";
      
      internal static var POSE6:String = "nodepose_6";
      
      internal static var POSE7:String = "nodepose_7";
      
      internal static var POSE8:String = "nodepose_8";
      
      internal static var POSE9:String = "nodepose_9";
      
      internal static var POSE10:String = "nodepose_10";
      
      internal static var GOTLAUNCHED_RISE:String = "gotlaunchedupwards_parta";
      
      internal static var GOTLAUNCHED_PEAK:String = "gotlaunchedupwards_partb";
      
      internal static var GOTLAUNCHED_FALL:String = "gotlaunchedupwards_partc";
      
      internal static var ENEMYDEATH:String = "deathenemy";
      
      internal static var ENEMYDEATHNOHAND:String = "deathnohand";
      
      internal static var ENEMYDEATHNOHEAD:String = "deathnohead";
      
      internal static var ENEMYDEATHARROW:String = "deathwitharrow";
      
      internal static var DEATHDOWNED:String = "deathdowned";
      
      internal static var DEATHINHALF:String = "deathinhalf";
      
      internal static var FLINCH_WEAPON:String = "flinch_weapon";
      
      internal static var FLINCH:String = "flinch";
      
      internal static var NINJAWALK:String = "ninjastealthwalk";
      
      internal static var NINJARUN:String = "ninjarun";
      
      internal static var NINJATHROW:String = "ninjashurikenthrow";
      
      internal static var NINJAJUMPSTART:String = "ninjashurikenjump_start";
      
      internal static var NINJAJUMPRISE:String = "ninjashurikenjump_midairrising";
      
      internal static var NINJAJUMPFALL:String = "ninjashurikenjump_midairfalling";
      
      internal static var NINJAJUMPLAND:String = "ninjashurikenjump_land";
      
      internal static var NINJAJUMPTHROW:String = "ninjashurikenmidairthrow";
      
      internal static var NINJASMOKEBOMB:String = "ninjasmokebombvanish";
      
      internal static var NINJASLASH:String = "ninjaslash";
      
      internal static var KATANAWALK:String = "walkwithkatana";
      
      internal static var KATANAATTACK:String = "katanaattack";
      
      internal static var ENEMYJUMP:String = "katanajump";
      
      internal static var ENEMYLAND:String = "katanadropdown";
      
      internal static var SPEARIDLE:String = "spear_idle";
      
      internal static var SPEARSPINSTART:String = "spear_spin_parta";
      
      internal static var SPEARSPINMID:String = "spear_spin_partb";
      
      internal static var SPEARSPINEND:String = "spear_spin_partc";
      
      internal static var SPEARTHROW:String = "spear_throw";
      
      internal static var SPEARLUNGESTART:String = "spear_lunge_parta";
      
      internal static var SPEARLUNGEMID:String = "spear_lunge_partb";
      
      internal static var SPEARLUNGEEND:String = "spear_lunge_partc";
      
      internal static var SPEARFLURRY:String = "spear_flurry";
      
      internal static var SPEARKICKSTART:String = "spear_kick_parta";
      
      internal static var SPEARKICKMID:String = "spear_kick_partb";
      
      internal static var SPEARKICKMID2:String = "spear_kick_partc";
      
      internal static var SPEARKICKEND:String = "spear_kick_partd";
      
      internal static var SPEARLAUNCH:String = "spear_launch";
      
      internal static var SPEARSWING:String = "spear_swing";
      
      internal static var SPEARSTABSTART:String = "spear_stab_parta";
      
      internal static var SPEARSTABEND:String = "spear_stab_partb";
      
      internal static var SPEARWALK:String = "walkwithspear";
      
      internal static var SPEARBOWJUMP:String = "spearbowjump";
      
      internal static var SPEARBOWLAND:String = "spearbowdropdown";
      
      internal static var SPEARCHARGE:String = "chargewithspear";
      
      internal static var SPEARRELAX:String = "spear_relax";
      
      internal static var SPEARRELAXWALK:String = "spear_relaxwalk";
      
      internal static var SHIELDIDLE:String = "holdshield";
      
      internal static var SHIELDCROUCH:String = "holdshield_crouch";
      
      internal static var SHIELDHOLD:String = "holdshield_defend";
      
      internal static var SHIELDSTARTRUN:String = "holdshield_startrun";
      
      internal static var SHIELDRUN:String = "holdshield_run";
      
      internal static var SHIELDWALK:String = "holdshieldwalk";
      
      internal static var SHIELDSTAB:String = "holdshieldstabattack";
      
      internal static var KNIFEWALK:String = "walkwithknife";
      
      internal static var KNIFEATTACK:String = "stabattack";
      
      internal static var BOWWALK:String = "walkwithbow";
      
      internal static var ARROWAIM:String = "aimarrow";
      
      internal static var ARROWRELOAD:String = "arrownormalpose";
      
      internal static var ARROWPULLBACK:String = "pullbackarrow";
      
      internal static var ARROWFIRE:String = "firearrow";
      
      internal static var BOWIDLE:String = "bowidle";
      
      internal static var WALK:String = "walk_normalpeople";
      
      internal static var RUN:String = "run_normalpeople";
      
      internal static var RUNPANIC:String = "runinterror";
      
      internal static var OLDMAN_IDLE:String = "oldman_idle";
      
      internal static var OLDMAN_WALK:String = "oldman_walk";
      
      internal static var OLDMAN_SHOW:String = "oldman_show";
      
      internal static var WOMAN_IDLE:String = "kimono_idle_1";
      
      internal static var WOMAN_IDLE2:String = "kimono_idle_2";
      
      internal static var WOMAN_WALK:String = "kimono_walk_1";
      
      internal static var WOMAN_WALK2:String = "kimono_walk_2";
      
      internal static var SEXY_WALK:String = "femalewalk";
      
      internal static var CORPSE1:String = "corpse1";
      
      internal static var CORPSE2:String = "corpse2";
      
      internal static var CORPSE3:String = "corpse3";
      
      internal static var CORPSE4:String = "corpse4";
      
      internal static var CORPSE5:String = "corpse5";
      
      internal static var BUSTPOSE1:String = "bustpose1";
      
      internal static var BEAR_IDLE:String = "bear_idle";
      
      internal static var BEAR_FIDGET:String = "bear_fidget";
      
      internal static var BEAR_WALK:String = "bear_walk";
      
      internal static var BEAR_RUN:String = "bear_run";
      
      internal static var BEAR_ATTACK:String = "bear_attack";
      
      internal static var BEAR_DEATH:String = "bear_death";
      
      internal static var BEAR_SIT:String = "bear_sit";
      
      internal static var BOAR_IDLE:String = "boar_idle";
      
      internal static var BOAR_FIDGET:String = "boar_fidget";
      
      internal static var BOAR_WALK:String = "boar_walk";
      
      internal static var BOAR_RUN:String = "boar_run";
      
      internal static var BOAR_ATTACK:String = "boar_attack";
      
      internal static var BOAR_DEATH:String = "boar_death";
      
      internal static var BOAR_GRAZING:String = "boar_grazing";
      
      internal static var BOAR_ROLLING:String = "boar_rolling";
      
      internal static var DEER_IDLE:String = "deer_idle";
      
      internal static var DEER_FIDGET:String = "deer_fidget";
      
      internal static var DEER_WALK:String = "deer_walk";
      
      internal static var DEER_RUN:String = "deer_run";
      
      internal static var DEER_GRAZING:String = "deer_grazing";
      
      internal static var DEER_DEATH:String = "deer_death";
      
      internal static var DEER_SIT:String = "deer_sit";
      
      internal static var DEER_GETUP:String = "deer_getup";
      
      internal static var HORSE_IDLE:String = "horse_idle";
      
      internal static var HORSE_WALK:String = "horse_walk";
      
      internal static var HORSE_RUN:String = "horse_run";
      
      internal static var HORSE_REARING:String = "horse_rearing";
      
      internal static var HORSE_GRAZING:String = "horse_grazing";
      
      internal static var HORSE_PAWING:String = "horse_pawing";
      
      internal static var STAG_CHARGE:String = "stag_charge";
      
      internal static var HORSE_DEATH:String = "horse_death";
      
      internal static var WOLF_IDLE:String = "wolf_idle";
      
      internal static var WOLF_WALK:String = "wolf_walk";
      
      internal static var WOLF_WALKBACKWARDS:String = "wolf_walkbackwards";
      
      internal static var WOLF_RUN:String = "wolf_run";
      
      internal static var WOLF_POUNCE_START:String = "wolf_pounce_start";
      
      internal static var WOLF_POUNCE_MID:String = "wolf_pounce_mid";
      
      internal static var WOLF_POUNCE_MIDHIGH:String = "wolf_pounce_midhigh";
      
      internal static var WOLF_POUNCE_END:String = "wolf_pounce_end";
      
      internal static var WOLF_BITE:String = "wolf_bite";
      
      internal static var WOLF_SNARL:String = "wolf_snarl";
      
      internal static var WOLF_DOWNED:String = "wolf_downed";
      
      internal static var WOLF_LAUNCHED:String = "wolf_launched";
      
      internal static var WOLF_LAUNCHEDEND:String = "wolf_launchedend";
      
      internal static var WOLF_DOWNEDTOIDLE:String = "wolf_getupfromdowned";
      
      internal static var WOLF_HOWL:String = "wolf_howl";
      
      internal static var WOLF_DEATH:String = "wolf_death";
      
      internal static var OGRE_IDLE:String = "ogre_idle";
      
      internal static var OGRE_FIDGET:String = "ogre_fidget";
      
      internal static var OGRE_WALK:String = "ogre_walk";
      
      internal static var OGRE_RUN:String = "ogre_run";
      
      internal static var OGRE_DEATH:String = "ogre_death";
      
      internal static var OGRE_SWINGDOWN:String = "ogre_swingdown";
      
      internal static var OGRE_SWINGDOWNHIT:String = "ogre_swingdownhit";
      
      internal static var OGRE_SWINGUP:String = "ogre_swingup";
      
      internal static var OGRE_SWINGUPHIT:String = "ogre_swinguphit";
      
      internal static var OGRE_SWINGUPEND:String = "ogre_swingupend";
      
      internal static var OGRE_STOMP:String = "ogre_stomp";
      
      internal static var OGRE_STOMPHIT:String = "ogre_stomphit";
      
      internal static var OGRE_THROW:String = "ogre_throw";
      
      internal static var OGRE_NAP1_START:String = "ogre_nap1_start";
      
      internal static var OGRE_NAP1_MID:String = "ogre_nap1_mid";
      
      internal static var OGRE_NAP1_END:String = "ogre_nap1_end";
      
      internal static var OGRE_NAP2_START:String = "ogre_nap2_start";
      
      internal static var OGRE_NAP2_END:String = "ogre_nap2_end";
      
      internal static var GUARDIAN_IDLE:String = "guardian_idle";
      
      internal static var GUARDIAN_FIDGET:String = "guardian_fidget";
      
      internal static var GUARDIAN_WALK:String = "guardian_walk";
      
      internal static var GUARDIAN_RUN:String = "guardian_run";
      
      internal static var GUARDIAN_DEATH:String = "guardian_death";
      
      internal static var GUARDIAN_SWINGDOWN:String = "guardian_swingdown";
      
      internal static var GUARDIAN_SWINGDOWNHIT:String = "guardian_swingdownhit";
      
      internal static var GUARDIAN_SWINGUP:String = "guardian_swingup";
      
      internal static var GUARDIAN_SWINGUPHIT:String = "guardian_swinguphit";
      
      internal static var GUARDIAN_SWINGUPEND:String = "guardian_swingupend";
      
      internal static var GUARDIAN_STOMP:String = "guardian_stomp";
      
      internal static var GUARDIAN_STOMPHIT:String = "guardian_stomphit";
      
      internal static var GUARDIAN_STOMPFREEZE:String = "guardian_stompfreeze";
      
      internal static var GUARDIAN_STOMPRETURN:String = "guardian_stompreturn";
      
      internal static var GUARDIAN_THROW:String = "guardian_throw";
      
      internal static var GUARDIAN_THROWRELEASE:String = "guardian_throwrelease";
      
      internal static var GOB_IDLE:String = "gob_idle";
      
      internal static var GOB_FIDGET:String = "gob_fidget";
      
      internal static var GOB_WALK:String = "gob_walk";
      
      internal static var GOB_RUN:String = "gob_run";
      
      internal static var GOB_DEATH:String = "gob_death";
      
      internal static var GOB_ATTACK:String = "gob_attack";
      
      internal static var GOB_POUNCE_START:String = "gob_pounce_start";
      
      internal static var GOB_POUNCE_MID:String = "gob_pounce_mid";
      
      internal static var GOB_POUNCE_END:String = "gob_pounce_end";
      
      internal static var GOB_THROW:String = "gob_throw";
      
      internal static var GOB_DASH_START:String = "gob_dash_start";
      
      internal static var GOB_DASH_MID:String = "gob_dash_mid";
      
      internal static var GOB_DASH_END:String = "gob_dash_end";
      
      internal static var GOB_JUMP_START:String = "gob_jump_start";
      
      internal static var GOB_JUMP_MID:String = "gob_jump_mid";
      
      internal static var GOB_JUMP_END:String = "gob_jump_end";
      
      internal static var ZOM_IDLE:String = "zom_idle";
      
      internal static var ZOM_WALK:String = "zom_walk";
      
      internal static var ZOM_ATTACK:String = "zom_attack";
      
      internal static var ZOM_ATTACK2:String = "zom_attack2";
      
      internal static var ZOM_ATTACK3:String = "zom_attack3";
      
      internal static var ZOM_GETUP:String = "zom_getup";
      
      internal static var ZOM_STUMBLE:String = "zom_stumble";
      
      internal static var ZOM_WALK2:String = "zom_walk2";
      
      internal static var ZOM_WALK3:String = "zom_walk3";
      
      internal static var ZOM_RUN:String = "zom_run";
      
      internal static var ZOM_CRAWL:String = "zom_crawl";
      
      internal static var ZOM_CRAWLATTACK_START:String = "zom_crawlattack_parta";
      
      internal static var ZOM_CRAWLATTACK:String = "zom_crawlattack_partb";
      
      internal static var ZOM_CRAWLDIE:String = "zom_crawldie";
      
      internal static var ZOM_DOWNEDTOCRAWL:String = "zom_downedtocrawl";
      
      internal static var ZOM_OUTGROUND:String = "zom_outground";
      
      internal static var JS_IDLE:String = "js_idle";
      
      internal static var JS_ALERT:String = "js_alert";
      
      internal static var JS_HOP:String = "js_hop";
      
      internal static var JS_RISE:String = "js_rise";
      
      internal static var JUTSU_GROUND_PARTA:String = "jutsu_ground_parta";
      
      internal static var JUTSU_GROUND_PARTB:String = "jutsu_ground_partb";
      
      internal static var JUTSU_PUNCH_PARTA:String = "jutsu_punch_parta";
      
      internal static var JUTSU_PUNCH_PARTB:String = "jutsu_punch_partb";
      
      internal static var JUTSU_BLOW_PARTA:String = "jutsu_blow_parta";
      
      internal static var JUTSU_BLOW_PARTB:String = "jutsu_blow_partb";
      
      internal static var STOMP_PARTA:String = "stomp_parta";
      
      internal static var STOMP_PARTB:String = "stomp_partb";
      
      internal static var PUNCHCOMBO_PARTA:String = "punchcombo_parta";
      
      internal static var PUNCHCOMBO_PARTB:String = "punchcombo_partb";
      
      internal static var PUNCHCOMBO_PARTC:String = "punchcombo_partc";
      
      internal static var PUNCHCOMBO_PARTD:String = "punchcombo_partd";
      
      internal static var NARUTORUN:String = "narutorun";
      
      internal static var JUTSU_AIR:String = "jutsu_air";
      
      internal static var GROUNDPUNCH_PARTA:String = "punchground_parta";
      
      internal static var GROUNDPUNCH_PARTB:String = "punchground_partb";
      
      internal static var CHARGEDSHOT_START:String = "chargedshot_start";
      
      internal static var CHARGEDSHOT_END:String = "chargedshot_end";
      
      internal static var FLURRY_PARTA:String = "flurry_parta";
      
      internal static var FLURRY_PARTB:String = "flurry_partb";
      
      internal static var FLURRY_PARTC:String = "flurry_partc";
      
      internal static var FLURRY_PARTD:String = "flurry_partd";
      
      internal static var FLURRY_PARTE:String = "flurry_parte";
      
      internal static var FLURRY_POSE:String = "flurry_pose";
      
      internal static var PUNCHLUNGE_START:String = "punchlunge_start";
      
      internal static var PUNCHLUNGE_MID:String = "punchlunge_mid";
      
      internal static var PUNCHLUNGE_END:String = "punchlunge_end";
      
      internal static var FIREBALL:String = "fireball";
      
      internal static var FRONTSPIN:String = "frontspin";
      
      internal static var BACKSPIN:String = "backspin";
      
      internal static var DEATHTOUCH_PARTA:String = "deathtouch_parta";
      
      internal static var DEATHTOUCH_PARTB:String = "deathtouch_partb";
      
      internal static var DEATHTOUCH_PARTC:String = "deathtouch_partc";
      
      internal static var DEATHTOUCH_PARTD:String = "deathtouch_partd";
      
      internal static var SPARTAKICK_START:String = "spartakick_start";
      
      internal static var SPARTAKICK_END:String = "spartakick_end";
      
      internal static var KNEEGROIN:String = "kneegroin";
      
      internal static var KNEEGROIN_VICTIM:String = "kneegroin_victim";
      
      internal static var BACKTHROW:String = "backthrow";
      
      internal static var BACKTHROW_VICTIM:String = "backthrow_victim";
      
      internal static var CLEAVE_START:String = "cleave_start";
      
      internal static var CLEAVE_END:String = "cleave_end";
      
      internal static var CLEAVE_POSE:String = "cleave_pose";
      
      internal static var SHUNPO_START:String = "shunpo_start";
      
      internal static var SHUNPO_END:String = "shunpo_end";
      
      internal static var ENCHANTWEAPON:String = "enchantweapon";
      
      internal static var BUFFARMOR_START:String = "buffarmor_start";
      
      internal static var BUFFARMOR_END:String = "buffarmor_end";
      
      internal static var WARCRY_START:String = "warcry_start";
      
      internal static var WARCRY_END:String = "warcry_end";
      
      internal static var PUNCH_START:String = "punch_start";
      
      internal static var PUNCH_END:String = "punch_end";
      
      internal static var FOCUS_START:String = "focus_start";
      
      internal static var FOCUS_END:String = "focus_end";
      
      internal static var AIRSTAB_START:String = "airstab_start";
      
      internal static var AIRSTAB_MID:String = "airstab_mid";
      
      internal static var AIRSTAB_STAB:String = "airstab_stab";
      
      internal static var AIRSTAB_END:String = "airstab_end";
      
      internal static var BULLCHARGE_START:String = "bullcharge_start";
      
      internal static var BULLCHARGE_RUN:String = "bullcharge_run";
      
      internal static var CHICHARGE_START:String = "chicharge_start";
      
      internal static var CHICHARGE_END:String = "chicharge_end";
      
      internal static var CHICHARGE_FLY:String = "chicharge_fly";
      
      internal static var IDLE_LIGHT:String = "light_stance";
      
      internal static var RUN_LIGHT:String = "light_run";
      
      internal static var LIGHTSLASH_START:String = "light_horslash_parta";
      
      internal static var LIGHTSLASH_MID:String = "light_horslash_partb";
      
      internal static var LIGHTSLASH_END:String = "light_horslash_partc";
      
      internal static var LIGHTSLASH_POSE:String = "light_horslash_partd";
      
      internal static var LIGHTSLASHDOWN_START:String = "light_downslash_parta";
      
      internal static var LIGHTSLASHDOWN_MID:String = "light_downslash_partb";
      
      internal static var LIGHTSLASHDOWN_END:String = "light_downslash_partc";
      
      internal static var LIGHTSLASHDOWN_POSE:String = "light_downslash_partd";
      
      internal static var LIGHTSLASHUP_START:String = "light_upslash_parta";
      
      internal static var LIGHTSLASHUP_MID:String = "light_upslash_partb";
      
      internal static var LIGHTSLASHUP_END:String = "light_upslash_partc";
      
      internal static var LIGHTSLASHUP_POSE:String = "light_upslash_partd";
      
      internal static var LIGHTFALLSLASH_START:String = "light_fallslash_parta";
      
      internal static var LIGHTFALLSLASH_MID:String = "light_fallslash_partb";
      
      internal static var LIGHTFALLSLASH_END:String = "light_fallslash_partc";
      
      internal static var LIGHTJUMPSLASH_START:String = "light_jumpslash_parta";
      
      internal static var LIGHTJUMPSLASH_RISE:String = "light_jumpslash_partb";
      
      internal static var LIGHTJUMPSLASH_SLASH:String = "light_jumpslash_partc";
      
      internal static var LIGHTJUMPSLASH_LAND:String = "light_jumpslash_partd";
      
      internal static var IDLE_BALANCED:String = "balanced_stance";
      
      internal static var RUN_BALANCED:String = "balanced_run";
      
      internal static var BALANCEDSLASH_START:String = "balanced_horslash_parta";
      
      internal static var BALANCEDSLASH_MID:String = "balanced_horslash_partb";
      
      internal static var BALANCEDSLASH_END:String = "balanced_horslash_partc";
      
      internal static var BALANCEDSLASH_POSE:String = "balanced_horslash_partd";
      
      internal static var BALANCEDSLASHDOWN_START:String = "balanced_downslash_parta";
      
      internal static var BALANCEDSLASHDOWN_MID:String = "balanced_downslash_partb";
      
      internal static var BALANCEDSLASHDOWN_END:String = "balanced_downslash_partc";
      
      internal static var BALANCEDSLASHDOWN_POSE:String = "balanced_downslash_partd";
      
      internal static var BALANCEDSLASHUP_START:String = "balanced_upslash_parta";
      
      internal static var BALANCEDSLASHUP_MID:String = "balanced_upslash_partb";
      
      internal static var BALANCEDSLASHUP_END:String = "balanced_upslash_partc";
      
      internal static var BALANCEDSLASHUP_POSE:String = "balanced_upslash_partd";
      
      internal static var BALANCEDFALLSLASH_START:String = "balanced_fallslash_parta";
      
      internal static var BALANCEDFALLSLASH_MID:String = "balanced_fallslash_partb";
      
      internal static var BALANCEDFALLSLASH_END:String = "balanced_fallslash_partc";
      
      internal static var BALANCEDJUMPSLASH_START:String = "balanced_jumpslash_parta";
      
      internal static var BALANCEDJUMPSLASH_RISE:String = "balanced_jumpslash_partb";
      
      internal static var BALANCEDJUMPSLASH_SLASH:String = "balanced_jumpslash_partc";
      
      internal static var BALANCEDJUMPSLASH_LAND:String = "balanced_jumpslash_partd";
      
      internal static var IDLE_HEAVY:String = "heavy_stance";
      
      internal static var RUN_HEAVY:String = "heavy_run";
      
      internal static var HEAVYSLASH_START:String = "heavy_horslash_parta";
      
      internal static var HEAVYSLASH_MID:String = "heavy_horslash_partb";
      
      internal static var HEAVYSLASH_END:String = "heavy_horslash_partc";
      
      internal static var HEAVYSLASH_POSE:String = "heavy_horslash_partd";
      
      internal static var HEAVYSLASHDOWN_START:String = "heavy_downslash_parta";
      
      internal static var HEAVYSLASHDOWN_MID:String = "heavy_downslash_partb";
      
      internal static var HEAVYSLASHDOWN_END:String = "heavy_downslash_partc";
      
      internal static var HEAVYSLASHDOWN_POSE:String = "heavy_downslash_partd";
      
      internal static var HEAVYSLASHUP_START:String = "heavy_upslash_parta";
      
      internal static var HEAVYSLASHUP_MID:String = "heavy_upslash_partb";
      
      internal static var HEAVYSLASHUP_END:String = "heavy_upslash_partc";
      
      internal static var HEAVYSLASHUP_POSE:String = "heavy_upslash_partd";
      
      internal static var HEAVYFALLSLASH_START:String = "heavy_fallslash_parta";
      
      internal static var HEAVYFALLSLASH_MID:String = "heavy_fallslash_partb";
      
      internal static var HEAVYFALLSLASH_END:String = "heavy_fallslash_partc";
      
      internal static var HEAVYJUMPSLASH_START:String = "heavy_jumpslash_parta";
      
      internal static var HEAVYJUMPSLASH_RISE:String = "heavy_jumpslash_partb";
      
      internal static var HEAVYJUMPSLASH_SLASH:String = "heavy_jumpslash_partc";
      
      internal static var HEAVYJUMPSLASH_LAND:String = "heavy_jumpslash_partd";
      
      internal static var IDLE_DUAL:String = "dual_stance";
      
      internal static var RUN_DUAL:String = "dual_run";
      
      internal static var DUALSLASH_START:String = "dual_horslash_parta";
      
      internal static var DUALSLASH_MID:String = "dual_horslash_partb";
      
      internal static var DUALSLASH_END:String = "dual_horslash_partc";
      
      internal static var DUALSLASH_POSE:String = "dual_horslash_partd";
      
      internal static var DUALSLASHDOWN_START:String = "dual_downslash_parta";
      
      internal static var DUALSLASHDOWN_MID:String = "dual_downslash_partb";
      
      internal static var DUALSLASHDOWN_END:String = "dual_downslash_partc";
      
      internal static var DUALSLASHDOWN_POSE:String = "dual_downslash_partd";
      
      internal static var DUALSLASHUP_START:String = "dual_upslash_parta";
      
      internal static var DUALSLASHUP_MID:String = "dual_upslash_partb";
      
      internal static var DUALSLASHUP_END:String = "dual_upslash_partc";
      
      internal static var DUALSLASHUP_POSE:String = "dual_upslash_partd";
      
      internal static var DUALFALLSLASH_START:String = "dual_fallslash_parta";
      
      internal static var DUALFALLSLASH_MID:String = "dual_fallslash_partb";
      
      internal static var DUALFALLSLASH_END:String = "dual_fallslash_partc";
      
      internal static var DUALJUMPSLASH_START:String = "dual_jumpslash_parta";
      
      internal static var DUALJUMPSLASH_RISE:String = "dual_jumpslash_partb";
      
      internal static var DUALJUMPSLASH_SLASH:String = "dual_jumpslash_partc";
      
      internal static var DUALJUMPSLASH_LAND:String = "dual_jumpslash_partd";
      
      internal static var IDLE_REVERSED:String = "reversed_stance";
      
      internal static var RUN_REVERSED:String = "reversed_run";
      
      internal static var REVERSEDSLASH_START:String = "reversed_slash_parta";
      
      internal static var REVERSEDSLASH_MID:String = "reversed_slash_partb";
      
      internal static var REVERSEDSLASH_END:String = "reversed_slash_partc";
      
      internal static var REVERSEDSLASH_POSE:String = "reversed_slash_partd";
      
      internal static var REVERSEDFALLSLASH_START:String = "reversed_fallslash_parta";
      
      internal static var REVERSEDFALLSLASH_MID:String = "reversed_fallslash_partb";
      
      internal static var REVERSEDFALLSLASH_END:String = "reversed_fallslash_partc";
      
      internal static var REVERSEDJUMPSLASH_START:String = "reversed_jumpslash_parta";
      
      internal static var REVERSEDJUMPSLASH_RISE:String = "reversed_jumpslash_partb";
      
      internal static var REVERSEDJUMPSLASH_SLASH:String = "reversed_jumpslash_partc";
      
      internal static var REVERSEDJUMPSLASH_LAND:String = "reversed_jumpslash_partd";
      
      internal static var IDLE_STATE:int = 0;
      
      internal static var RUN_STATE:int = 1;
      
      internal static var WALK_STATE:int = 2;
      
      internal static var JUMP_STATE:int = 3;
      
      internal static var FALL_STATE:int = 4;
      
      internal static var LAND_STATE:int = 5;
      
      internal static var GOTLAUNCHED_STATE:int = 6;
      
      internal static var SLASH_START_STATE:int = 7;
      
      internal static var SLASH_STATE:int = 8;
      
      internal static var POSE_STATE:int = 9;
      
      internal static var ATTACK_STATE:int = 10;
      
      internal static var DOWNED_STATE:int = 11;
      
      internal static var DYING_STATE:int = 12;
      
      internal static var REDFREEZE_STATE:int = 13;
      
      internal static var CHARGING_STATE:int = 14;
      
      internal static var AIM_STATE:int = 15;
      
      internal static var RELOAD_STATE:int = 16;
      
      internal static var THROW_STATE:int = 17;
      
      internal static var JUMPTHROW_STATE:int = 18;
      
      internal static var SMOKEBOMB_STATE:int = 19;
      
      internal static var FORWARDROLL_STATE:int = 20;
      
      internal static var DOSKILL_STATE:int = 21;
      
      internal static var STAB_STATE:int = 22;
      
      internal static var SMOKEBOMB2_STATE:int = 23;
      
      internal static var LAYTRAP_STATE:int = 24;
      
      internal static var WINDKICK_STATE:int = 25;
      
      internal static var CRAWL_STATE:int = 26;
      
      internal static var CRAWLATTACK_STATE:int = 27;
      
      internal static var FLINCH_STATE:int = 28;
      
      internal static var NAP_STATE:int = 29;
      
      internal static var DASH_STATE:int = 30;
      
      internal static var KNOCKDOWNED_STATE:int = 31;
      
      internal static var FLY_STATE:int = 32;
      
      internal static var STUN_STATE:int = 33;
      
      internal static var BACKSTEP_STATE:int = 34;
      
      internal static var LOGSUBSTITUTION_STATE:int = 35;
      
      internal static var SKILL_GROUNDPUNCH_STATE:int = 36;
      
      internal static var SKILL_CHIBURST_STATE:int = 37;
      
      internal static var SKILL_SHUNPO_STATE:int = 38;
      
      internal static var SKILL_THOUSANDSTABS_STATE:int = 39;
      
      internal static var SKILL_DEADLYCLEAVE_STATE:int = 40;
      
      internal static var SKILL_HEAVENLYSWORDS_STATE:int = 41;
      
      internal static var SKILL_SPIRITTHIEF_STATE:int = 42;
      
      internal static var SKILL_DEATHTOUCH_STATE:int = 43;
      
      internal static var SKILL_FLASHBANG_STATE:int = 44;
      
      internal static var SKILL_STEALTH_STATE:int = 45;
      
      internal static var SKILL_SHADOWCLONE_STATE:int = 46;
      
      internal static var SKILL_MASSCLONE_STATE:int = 47;
      
      internal static var SKILL_SUBSTITUTIONLOG_STATE:int = 48;
      
      internal static var VICTIM_STATE:int = 49;
      
      internal static var CLIMB_STATE:int = 50;
      
      internal static var SKILL_SUMMON_STATE:int = 51;
      
      internal static var MOVE_STATE:int = 52;
      
      internal static var SKILL_BACKTHROW_STATE:int = 53;
      
      internal static var SKILL_BULLCHARGE_STATE:int = 54;
      
      internal static var SKILL_PUNCHLUNGE_STATE:int = 55;
      
      internal static var SKILL_UNDYING_STATE:int = 56;
      
      internal static var SKILL_CHICHARGE_STATE:int = 57;
      
      internal static var SKILL_FIREBREATH_STATE:int = 58;
      
      internal static var SKILL_WATERSPLASH_STATE:int = 59;
      
      internal static var SKILL_INFERNO_STATE:int = 60;
      
      internal static var SKILL_TSUNAMI_STATE:int = 61;
      
      internal static var SKILL_TORNADO_STATE:int = 62;
      
      internal static var SKILL_EARTHQUAKE_STATE:int = 63;
      
      public var mcs:MCSCharacter = null;
      
      internal var posX:int;
      
      internal var gotHitFlag:Boolean = false;
      
      private var hp:int = 1;
      
      internal var maxhp:int = 1;
      
      internal var dead:Boolean = false;
      
      internal var behead:Boolean = false;
      
      internal var actionState:int;
      
      internal var animFrozen:Boolean = false;
      
      public function MCSActor()
      {
         super();
      }
      
      public function initMCS(armorid:Item, glovesid:Item, hairid:Item, hatid:Item, headid:Item, maskid:Item, neckid:Item, pantsid:Item, shoesid:Item, weaponid:Item, propid:int = 0, prop2id:int = 0) : *
      {
         this.mcs.initMCS(armorid,glovesid,hairid,hatid,headid,maskid,neckid,pantsid,shoesid,weaponid,propid,prop2id);
      }
      
      public function initMCSFromXML(xml:XMLList) : *
      {
         this.mcs.initMCSFromXML(xml);
      }
      
      public function addToCanvas(canvas:MovieClip) : *
      {
         canvas.addChild(this.mcs);
      }
      
      public function removeFromCanvas(canvas:MovieClip) : *
      {
         if(this.mcs != null)
         {
            canvas.removeChild(this.mcs);
         }
      }
      
      public function setPosition(x:int, y:int) : *
      {
         this.mcs.x = x - StageManager.getStagePosition();
         this.mcs.y = y;
         this.posX = x;
      }
      
      public function movePositionX(x:int) : *
      {
         this.mcs.x += x;
         this.posX += x;
      }
      
      public function getMapPosition() : int
      {
         return this.posX;
      }
      
      public function setHP(val:int) : *
      {
         this.hp = val * StatsManager.multiplier;
      }
      
      public function getHP() : int
      {
         return this.hp / StatsManager.multiplier;
      }
      
      internal function startAnim(animName:String) : *
      {
         this.mcs.startAnim(animName);
      }
      
      internal function getAnim() : String
      {
         return this.mcs.getAnim();
      }
      
      public function isDead() : Boolean
      {
         return this.dead;
      }
      
      public function die() : *
      {
         this.actionState = DYING_STATE;
      }
      
      internal function deathAnimEnd() : *
      {
      }
      
      public function redFreeze() : *
      {
         ColorCode.makeBlack(this.mcs);
         this.animFrozen = true;
         this.mcs.setDisplayName("");
      }
      
      public function unRedFreeze() : *
      {
         this.animFrozen = false;
      }
      
      public function clearFilter() : *
      {
         if(this.mcs != null)
         {
            ColorCode.clearFilter(this.mcs);
         }
      }
      
      public function getMCS() : MCSCharacter
      {
         return this.mcs;
      }
   }
}

