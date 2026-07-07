import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'CSTBAEventTool.dart';
import 'cs_extension_help.dart';


class CSLocalProvider extends ChangeNotifier {
  // 1. 私有构造函数（禁止外部直接创建实例）
  CSLocalProvider._();

  // 2. 静态单例实例
  static final CSLocalProvider _instance = CSLocalProvider._();

  // 3. 提供全局访问点
  static CSLocalProvider get instance => _instance;

  String cs_account_id = '';
  String cs_tx_list = "";
  String cs_ratio_str = "90";

  bool cs_bg_music = true; // 存储的本地值
  bool cs_sound_music = true; // 存储的本地值
  bool cs_login_status = false; // 存储的本地值
  bool cs_scratch_status_0 = true;
  bool cs_scratch_status_1 = true;
  bool cs_scratch_status_2 = true;
  bool cs_scratch_status_3 = true;
  bool cs_scratch_status_4 = true;
  bool cs_scratch_status_5 = true;
  bool cs_scratch_status_6 = true;
  bool cs_scratch_status_7 = true;
  bool cs_scratch_status_8 = true;
  bool cs_scratch_guide = true;
  bool cs_old_guide = true;
  bool cs_new_guide = false;
  bool is_end_Scratch = true;
  bool cs_show_dolas_ani = false;
  bool cs_show_bubble = false;
  bool cs_show_box_guide = false;
  bool cs_cloak_status = false;
  bool cs_fk_number_status = false;
  bool cs_fk_decvice_status = false;
  bool cs_fk_ip_status = false;
  bool cs_fk_ad_short_show = false;
  bool cs_fk_ad_short_close = false;
  bool cs_dolas_800 = false;
  bool cs_dolas_1000 = false;
  bool cs_yunying_3 = false;
  bool cs_yunying_1 = false;
  bool cs_100_timer_star = false;
  bool cs_txing_status = false;
  bool cs_tx_first_status = false;
  bool cs_tx_last_status = false;
  bool cs_show_box_tips = false;
  bool cs_first_box_tips = false;
  bool cs_first_show_cash = false;
  bool cs_first_show_rank = false;
  bool cs_open_tx = false;
  bool cs_tx_task2_tips = false;
  bool cs_last_tx_end = false;
  bool cs_show_box = false;
  bool cs_tx_task3_tips = false;
  bool cs_tx_task4_tips = false;
  bool cs_tx_end_status = false;
  bool cs_afSwitch = true;
  bool cs_set_root = false;
  bool cs_af_status = false;
  bool cs_newA_guide = false;
  bool cs_good_review_status = false;
  bool cs_show_80_pop = false;
  bool cs_show_rank = false;
  bool cs_tx_ing_status = false;
  bool cs_install_status = false;
  bool cs_dolas_80_end = false;

  int cs_scrach_unlock_index_0 = 0; // 存储的本地值
  int cs_scrach_unlock_index_1 = 0; // 存储的本地值
  int cs_ad_all_number = 0;
  double cs_dollar_number = 0.00;
  double cs_dolas_old_number = 0.0;
  double add_olduser_point = 3.0;
  int cs_ad_reawrd_all_number = 0;
  int cs_ad_short_show_number = 0;
  int cs_ad_short_close_number = 0;
  int cs_ad_show_index = 0;
  int cs_ad_show_number = 0;
  int cs_key_number = 0;
  int cs_account_seled_index = 0;
  int cs_tx_ing_account = 0;
  int cs_tx_ing_number = 0;
  int cs_tx_task_index = 0;
  int cs_current_ranking = 99;
  int cs_all_ranking = 388;
  int cs_rank_ad_count = 0;
  int cs_tx_card_index = 0;
  int cs_tx_wheel_index = 0;
  int cs_tx_bubble_index = 0;
  int cs_box_index = 0;
  int cs_card_number = 0;
  int cs_Level_number = 1; // 存储的本地值
  int cs_Level_inedx = 1; // 存储的本地值
  int cs_dice_number = 0;
  int cs_card_a_number = 0;
  int cs_scrach_end_number_0 = 0; // 存储的本地值
  int cs_scrach_end_number_1 = 0; // 存储的本地值
  int cs_scrach_end_number_2 = 0; // 存储的本地值
  int cs_scrach_end_number_3 = 0; // 存储的本地值
  int cs_scrach_end_number_4 = 0; // 存储的本地值
  int cs_scrach_end_number_5 = 0; // 存储的本地值
  int cs_currentNumberIndex = 0;
  int cs_domand_number = 0;
  int cs_tx_card_first = 0;
  int cs_tx_dice_index = 0;
  int cs_quiz_task_index = 0;
  int new_ad_console = 1;
  int cs_zhuan_number = 0;
  int cs_quiz_tap_index = 0;
  int cs_tx_box_index = 0;

  int cs_scratch_box_index = 0;

  int cs_scratch_gua_index = 0;

  int card_push_number = 8;

  int cs_scratch_not_award_number = 0;

  // 主题类型
  int cs_quiz_model_index = 0;

  int cs_scratch_num_row = 0;

  int cs_scratch_num_index = 0;

  // 当前第几题
  int cs_quiz_num_index = 0;
  int cs_quzi_row = 0;
  int cs_wheel_number = 0;
  int cs_pig_level = 0;
  double cs_pig_level_index = 0.0;
  int cs_quiz_all_num = 0;
  int quiz_console = 5;


  String cs_scrach_end_time_0 = ''; // 存储的本地值
  String cs_scrach_end_time_1 = ''; // 存储的本地值
  String cs_scrach_end_time_2 = ''; // 存储的本地值
  String cs_scrach_end_time_3 = ''; // 存储的本地值
  String cs_scrach_end_time_4 = ''; // 存储的本地值
  String cs_scrach_end_time_5 = ''; // 存储的本地值

  // 加速卡
  double cs_card_quicken_num = 0.0;

  bool cs_card_quicken_30 = false;

  bool cs_card_quicken_50 = false;

  bool cs_card_quicken_80 = false;

  bool cs_card_quicken_90 = false;

  bool cs_card_quicken_1 = false;

  bool cs_card_quicken_01 = false;

  bool cs_first_show_home = false;

  bool cs_new_guide_end = false;

  int cs_qunm_ad_index = 0;

  String get cs_currentNumberIndexName => 'cs_currentNumberIndex';

  String get cs_dice_numberName => 'cs_dice_number';

  String get cs_domand_numberName => 'cs_domand_number';

  String get cs_sound_musicName => 'cs_sound_music';

  String get cs_bg_musicName => 'cs_bg_music';

  String get cs_Level_numberName => 'cs_Level_number';

  String get cs_Level_inedxName => 'cs_Level_inedx';

  String get cs_fk_number_statusName => 'cs_fk_number_status';

  String get cs_fk_ip_statusName => 'cs_fk_ip_status';

  String get cs_fk_decvice_statusName => 'cs_fk_decvice_status';

  String get cs_ad_show_numberName => 'cs_ad_show_number';

  String get cs_ad_all_numberName => 'cs_ad_all_number';

  String get cs_ad_show_indexName => 'cs_ad_show_index';

  String get cs_ad_reawrd_all_numberName => 'cs_ad_reawrd_all_number';

  String get cs_ad_short_show_numberName => 'cs_ad_short_show_number';

  String get cs_fk_ad_short_showName => 'cs_fk_ad_short_show';

  String get cs_ad_short_close_numberName => 'cs_ad_short_close_number';

  String get cs_fk_ad_short_closeName => 'cs_fk_ad_short_close';

  String get cs_new_guideName => 'cs_new_guide';

  String get cs_ratio_strName => 'cs_ratio_str';

  String get cs_dolas_1000Name => 'cs_dolas_1000';

  String get cs_dolas_800Name => 'cs_dolas_800';

  String get cs_100_timer_starName => 'cs_100_timer_star';

  String get cs_dolas_numberName => 'cs_dollar_number';

  String get cs_card_numberName => 'cs_card_number';

  String get cs_show_dolas_aniName => 'cs_show_dolas_ani';

  String get cs_box_indexName => 'cs_box_index';

  String get cs_txing_statusName => 'cs_txing_status';

  String get cs_tx_ing_numberName => 'cs_tx_ing_number';

  String get cs_account_seled_indexName => 'cs_account_seled_index';

  String get cs_tx_ing_accountName => 'cs_tx_ing_account';

  String get cs_tx_bubble_indexName => 'cs_tx_bubble_index';

  String get cs_tx_card_indexName => 'cs_tx_card_index';

  String get cs_tx_wheel_indexName => 'cs_tx_wheel_index';

  String get cs_tx_task_indexName => 'cs_tx_task_index';

  String get cs_tx_card_firstName => 'cs_tx_card_first';

  String get cs_account_idName => 'cs_account_id';

  String get cs_tx_dice_indexName => 'cs_tx_dice_index';

  String get cs_tx_first_statusName => 'cs_tx_first_status';

  String get cs_tx_last_statusName => 'cs_tx_last_status';

  String get cs_current_rankingName => 'cs_current_ranking';

  String get cs_all_rankingName => 'cs_all_ranking';

  String get cs_old_guideName => 'cs_old_guide';

  String get cs_scratch_not_award_numberName => 'cs_scratch_not_award_number';

  String get cs_cloak_statusName => 'cs_cloak_status';

  String get cs_show_box_tipsName => 'cs_show_box_tips';

  String get cs_first_box_tipsName => 'cs_first_box_tips';

  String get cs_first_show_cashName => 'cs_first_show_cash';

  String get cs_scratch_guideName => 'cs_scratch_guide';

  String get cs_open_txName => 'cs_open_tx';

  String get cs_tx_task2_tipsName => 'cs_tx_task2_tips';

  String get cs_last_tx_endName => 'cs_last_tx_end';

  String get is_end_ScratchName => 'is_end_Scratch';

  String get cs_yunying_1Name => 'cs_yunying_1';

  String get cs_yunying_3Name => 'cs_yunying_3';

  String get cs_show_boxName => 'cs_show_box';

  String get cs_tx_task3_tipsName => 'cs_tx_task3_tips';

  String get cs_tx_task4_tipsName => 'cs_tx_task4_tips';

  String get cs_tx_end_statusName => 'cs_tx_end_status';

  String get cs_dolas_old_numberName => 'cs_dolas_old_number';

  String get cs_afSwitchName => 'cs_afSwitch';

  String get cs_set_rootName => 'cs_set_root';

  String get cs_login_statusName => 'cs_login_status';

  String get cs_af_statusName => 'cs_af_status';

  String get cs_newA_guideName => 'cs_newA_guide';

  String get cs_good_review_statusName => 'cs_good_review_status';

  String get cs_card_a_numberName => 'cs_card_a_number';

  String get cs_quiz_model_indexName => 'cs_quiz_model_index';

  String get cs_quiz_num_indexName => 'cs_quiz_num_index';

  String get cs_quzi_rowName => 'cs_quzi_row';

  String get cs_wheel_numberName => 'cs_wheel_number';

  String get cs_pig_levelName => 'cs_pig_level';

  String get cs_pig_level_indexName => 'cs_pig_level_index';

  String get cs_quiz_task_indexName => 'cs_quiz_task_index';

  String get new_ad_consoleName => 'new_ad_console';

  String get cs_zhuan_numberName => 'cs_zhuan_number';

  String get cs_quiz_all_numName => 'cs_quiz_all_num';

  String get cs_quiz_tap_indexName => 'cs_quiz_tap_index';

  String get cs_show_80_popName => 'cs_show_80_pop';

  String get cs_show_rankName => 'cs_show_rank';

  String get cs_tx_ing_statusName => 'cs_tx_ing_status';

  String get add_olduser_pointName => 'add_olduser_point';

  String get cs_install_statusName => 'cs_install_status';

  String get quiz_consoleName => 'quiz_console';

  String get cs_tx_box_indexName => 'cs_tx_box_index';

  String get cs_scrach_end_number_0Name => 'cs_scrach_end_number_0';

  String get cs_scrach_end_number_1Name => 'cs_scrach_end_number_1';

  String get cs_scrach_end_number_2Name => 'cs_scrach_end_number_2';

  String get cs_scrach_end_number_3Name => 'cs_scrach_end_number_3';

  String get cs_scrach_end_number_4Name => 'cs_scrach_end_number_4';

  String get cs_scrach_end_number_5Name => 'cs_scrach_end_number_5';

  String get cs_scratch_box_indexName => 'cs_scratch_box_index';

  String get card_push_numberName => 'card_push_number';

  String get cs_scratch_gua_indexName => 'cs_scratch_gua_index';

  String get cs_dolas_80_endName => 'cs_dolas_80_end';

  String get cs_scratch_num_rowName => 'cs_scratch_num_row';

  String get cs_scratch_num_indexName => 'cs_scratch_num_index';

  String get cs_card_quicken_numName => 'cs_card_quicken_nums';

  String get cs_card_quicken_30Name => 'cs_card_quicken_30';

  String get cs_card_quicken_50Name => 'cs_card_quicken_50';

  String get cs_card_quicken_80Name => 'cs_card_quicken_80';

  String get cs_card_quicken_90Name => 'cs_card_quicken_90';

  String get cs_card_quicken_1Name => 'cs_card_quicken_1';

  String get cs_card_quicken_01Name => 'cs_card_quicken_01';

  String get cs_scrach_end_time_0Name => 'cs_scrach_end_time_0';

  String get cs_scrach_end_time_1Name => 'cs_scrach_end_time_1';

  String get cs_scrach_end_time_2Name => 'cs_scrach_end_time_2';

  String get cs_scrach_end_time_3Name => 'cs_scrach_end_time_3';

  String get cs_scrach_end_time_4Name => 'cs_scrach_end_time_4';

  String get cs_scrach_end_time_5Name => 'cs_scrach_end_time_5';

  String get cs_show_box_guideName => 'cs_show_box_guide';

  String get cs_qunm_ad_indexName => 'cs_qunm_ad_index';

  String get cs_first_show_rankName => 'cs_first_show_rank';

  String get cs_rank_ad_countName => 'cs_rank_ad_count';

  String get cs_first_show_homeName => 'cs_first_show_home';

  String get cs_new_guide_endName => 'cs_new_guide_end';

  // 3. 初始化：从本地存储加载数据（组件初始化时调用）
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    // 从本地读取值（key自定义，需与存储时一致）
    cs_tx_dice_index =  prefs.getInt('cs_tx_dice_index') ?? 0;
    cs_tx_card_first =  prefs.getInt('cs_tx_card_first') ?? 0;
    cs_domand_number =  prefs.getInt('cs_domand_number') ?? 0;
    cs_dice_number =  prefs.getInt('cs_dice_number') ?? 0;
    cs_card_number =  prefs.getInt('cs_card_number') ?? 0;
    cs_box_index =  prefs.getInt('cs_box_index') ?? 0;
    cs_tx_card_index =  prefs.getInt('cs_tx_card_index') ?? 0;
    cs_wheel_number =  prefs.getInt('cs_wheel_number') ?? 0;
    cs_pig_level =  prefs.getInt('cs_pig_level') ?? 0;
    cs_tx_box_index =  prefs.getInt('cs_tx_box_index') ?? 0;
    cs_pig_level_index =  prefs.getDouble('cs_pig_level_index') ?? 0.0;
    add_olduser_point =  prefs.getDouble('add_olduser_point') ?? 3.0;
    cs_tx_wheel_index =  prefs.getInt('cs_tx_wheel_index') ?? 0;
    cs_tx_bubble_index =  prefs.getInt('cs_tx_bubble_index') ?? 0;
    cs_current_ranking =  prefs.getInt('cs_current_ranking') ?? 99;
    cs_all_ranking =  prefs.getInt('cs_all_ranking') ?? 388;
    cs_rank_ad_count =  prefs.getInt('cs_rank_ad_count') ?? 388;
    cs_tx_task_index =  prefs.getInt('cs_tx_task_index') ?? 0;
    cs_quiz_task_index =  prefs.getInt('cs_quiz_task_index') ?? 0;
    cs_tx_ing_account =  prefs.getInt('cs_tx_ing_account') ?? 0;
    cs_tx_ing_number =  prefs.getInt('cs_tx_ing_number') ?? 0;
    cs_card_a_number =  prefs.getInt('cs_card_a_number') ?? 0;
    cs_quiz_model_index =  prefs.getInt('cs_quiz_model_index') ?? 0;
    cs_quiz_num_index =  prefs.getInt('cs_quiz_num_index') ?? 0;
    cs_zhuan_number =  prefs.getInt('cs_zhuan_number') ?? 0;
    cs_quiz_all_num =  prefs.getInt('cs_quiz_all_num') ?? 0;
    cs_quiz_tap_index =  prefs.getInt('cs_quiz_tap_index') ?? 0;
    cs_scratch_box_index =  prefs.getInt('cs_scratch_box_index') ?? 0;
    cs_qunm_ad_index = prefs.getInt('cs_qunm_ad_index') ?? 0;
    cs_scratch_not_award_number =
         prefs.getInt('cs_scratch_not_award_number') ?? 0;
    cs_account_seled_index =  prefs.getInt('cs_account_seled_index') ?? 0;
    cs_scrach_unlock_index_0 =  prefs.getInt('cs_scrach_unlock_index_0') ?? 0;
    cs_scrach_unlock_index_1 =  prefs.getInt('cs_scrach_unlock_index_1') ?? 0;
    cs_ad_short_show_number =  prefs.getInt('cs_ad_short_show_number') ?? 0;
    cs_ad_short_close_number =  prefs.getInt('cs_ad_short_close_number') ?? 0;
    cs_ad_show_number =  prefs.getInt('cs_ad_show_number') ?? 0;
    cs_key_number =  prefs.getInt('cs_key_number') ?? 0;
    cs_quzi_row =  prefs.getInt('cs_quzi_row') ?? 0;
    cs_wheel_number =  prefs.getInt('cs_wheel_number') ?? 0;
    quiz_console =  prefs.getInt('quiz_console') ?? 5;
    new_ad_console =  prefs.getInt('new_ad_console') ?? 1;
    cs_bg_music =  prefs.getBool('cs_bg_music') ?? true;
    cs_sound_music =  prefs.getBool('cs_sound_music') ?? true;
    cs_tx_task3_tips =  prefs.getBool('cs_tx_task3_tips') ?? false;
    cs_tx_task4_tips =  prefs.getBool('cs_tx_task4_tips') ?? false;
    cs_txing_status =  prefs.getBool('cs_txing_status') ?? false;
    cs_login_status =  prefs.getBool('cs_login_status') ?? false;
    cs_first_show_home = prefs.getBool('cs_first_show_home') ?? false;
    cs_good_review_status =  prefs.getBool('cs_good_review_status') ?? false;
    cs_open_tx =  prefs.getBool('cs_open_tx') ?? false;
    cs_new_guide_end = prefs.getBool('cs_new_guide_end') ?? false;
    cs_first_show_rank = prefs.getBool('cs_first_show_rank') ?? false;
    cs_install_status =  prefs.getBool('cs_install_status') ?? false;
    cs_show_box =  prefs.getBool('cs_show_box') ?? false;
    cs_afSwitch =  prefs.getBool('cs_afSwitch') ?? true;
    cs_set_root =  prefs.getBool('cs_set_root') ?? false;
    cs_show_rank =  prefs.getBool('cs_show_rank') ?? false;
    cs_af_status =  prefs.getBool('cs_af_status') ?? false;
    is_end_Scratch =  prefs.getBool('is_end_Scratch') ?? true;
    cs_cloak_status =  prefs.getBool('cs_cloak_status') ?? false;
    cs_show_box_tips =  prefs.getBool('cs_show_box_tips') ?? false;
    cs_first_box_tips =  prefs.getBool('cs_first_box_tips') ?? false;
    cs_fk_number_status =  prefs.getBool('cs_fk_number_status') ?? false;
    cs_fk_decvice_status =  prefs.getBool('cs_fk_decvice_status') ?? false;
    cs_fk_ad_short_show =  prefs.getBool('cs_fk_ad_short_show') ?? false;
    cs_fk_ad_short_close =  prefs.getBool('cs_fk_ad_short_close') ?? false;
    cs_fk_ip_status =  prefs.getBool('cs_fk_ip_status') ?? false;
    cs_newA_guide =  prefs.getBool('cs_newA_guide') ?? false;
    cs_scratch_guide =  prefs.getBool('cs_scratch_guide') ?? true;
    cs_old_guide =  prefs.getBool('cs_old_guide') ?? true;
    cs_new_guide =  prefs.getBool('cs_new_guide') ?? false;
    cs_show_bubble =  prefs.getBool('cs_show_bubble') ?? false;
    cs_show_dolas_ani =  prefs.getBool('cs_show_dolas_ani') ?? false;
    cs_show_box_guide =  prefs.getBool('cs_show_box_guide') ?? false;
    cs_dolas_800 =  prefs.getBool('cs_dolas_800') ?? false;
    cs_dolas_1000 =  prefs.getBool('cs_dolas_1000') ?? false;
    cs_100_timer_star =  prefs.getBool('cs_100_timer_star') ?? false;
    cs_tx_first_status =  prefs.getBool('cs_tx_first_status') ?? false;
    cs_tx_last_status =  prefs.getBool('cs_tx_last_status') ?? false;
    cs_first_show_cash =  prefs.getBool('cs_first_show_cash') ?? false;
    cs_tx_task2_tips =  prefs.getBool('cs_tx_task2_tips') ?? false;
    cs_last_tx_end =  prefs.getBool('cs_last_tx_end') ?? false;
    cs_yunying_3 =  prefs.getBool('cs_yunying_3') ?? false;
    cs_yunying_1 =  prefs.getBool('cs_yunying_1') ?? false;
    cs_tx_end_status =  prefs.getBool('cs_tx_end_status') ?? false;
    cs_show_80_pop =  prefs.getBool('cs_show_80_pop') ?? false;
    cs_tx_ing_status =  prefs.getBool('cs_tx_ing_status') ?? false;
    cs_ad_reawrd_all_number =  prefs.getInt('cs_ad_reawrd_all_number') ?? 0;
    cs_ad_all_number =  prefs.getInt('cs_ad_all_number') ?? 0;
    cs_dollar_number =  prefs.getDouble('cs_dollar_number') ?? 0.00;
    cs_dolas_old_number =  prefs.getDouble('cs_dolas_old_number') ?? 0.0;
    cs_ad_show_index =  prefs.getInt('cs_ad_show_index') ?? 0;
    cs_Level_number =  prefs.getInt('cs_Level_number') ?? 1;
    cs_Level_inedx =  prefs.getInt('cs_Level_inedx') ?? 1;
    cs_scrach_end_number_0 =  prefs.getInt('cs_scrach_end_number_0') ?? 0;
    cs_scrach_end_number_1 =  prefs.getInt('cs_scrach_end_number_1') ?? 0;
    cs_scrach_end_number_2 =  prefs.getInt('cs_scrach_end_number_2') ?? 0;
    cs_scrach_end_number_3 =  prefs.getInt('cs_scrach_end_number_3') ?? 0;
    cs_scrach_end_number_4 =  prefs.getInt('cs_scrach_end_number_4') ?? 0;
    cs_scrach_end_number_5 =  prefs.getInt('cs_scrach_end_number_5') ?? 0;
    cs_currentNumberIndex =  prefs.getInt('cs_currentNumberIndex') ?? 0;
    cs_scratch_status_0 =  prefs.getBool('cs_scratch_status_0') ?? true;
    cs_scratch_status_1 =  prefs.getBool('cs_scratch_status_1') ?? true;
    cs_scratch_status_2 =  prefs.getBool('cs_scratch_status_2') ?? true;
    cs_scratch_status_3 =  prefs.getBool('cs_scratch_status_3') ?? true;
    cs_scratch_status_4 =  prefs.getBool('cs_scratch_status_4') ?? true;
    cs_scratch_status_5 =  prefs.getBool('cs_scratch_status_5') ?? true;
    cs_scratch_status_6 =  prefs.getBool('cs_scratch_status_6') ?? true;
    cs_scratch_status_7 =  prefs.getBool('cs_scratch_status_7') ?? true;
    cs_scratch_status_8 =  prefs.getBool('cs_scratch_status_8') ?? true;
    cs_dolas_80_end =  prefs.getBool('cs_dolas_80_end') ?? true;
    cs_card_quicken_30 =  prefs.getBool('cs_card_quicken_30') ?? false;
    cs_card_quicken_50 =  prefs.getBool('cs_card_quicken_50') ?? false;
    cs_card_quicken_80 =  prefs.getBool('cs_card_quicken_80') ?? false;
    cs_card_quicken_90 =  prefs.getBool('cs_card_quicken_90') ?? false;
    cs_card_quicken_1 =  prefs.getBool('cs_card_quicken_1') ?? false;
    cs_card_quicken_01 =  prefs.getBool('cs_card_quicken_01') ?? false;
    cs_ratio_str = prefs.getString('cs_ratio_str') ?? '90';
    cs_account_id = prefs.getString('cs_account_id') ?? '';
    cs_tx_list = prefs.getString("cs_tx_list") ?? "";
    cs_scrach_end_time_0 = prefs.getString("cs_scrach_end_time_0") ?? "";
    cs_scrach_end_time_1 = prefs.getString("cs_scrach_end_time_1") ?? "";
    cs_scrach_end_time_2 = prefs.getString("cs_scrach_end_time_2") ?? "";
    cs_scrach_end_time_3 = prefs.getString("cs_scrach_end_time_3") ?? "";
    cs_scrach_end_time_4 = prefs.getString("cs_scrach_end_time_4") ?? "";
    cs_scrach_end_time_5 = prefs.getString("cs_scrach_end_time_5") ?? "";
    card_push_number = prefs.getInt('card_push_number') ?? 8;
    cs_scratch_gua_index = prefs.getInt('cs_scratch_gua_index') ?? 0;
    cs_scratch_num_row = prefs.getInt('cs_scratch_num_row') ?? 0;
    cs_scratch_num_index = prefs.getInt('cs_scratch_num_index') ?? 0;
    cs_card_quicken_num = prefs.getDouble('cs_card_quicken_nums') ?? 0;
    Future.delayed(Duration(milliseconds: 100),(){
      'updateUI=${cs_dollar_number}'.log();
      notifyListeners(); // 加载完成后通知UI更新
    });
  }

  // 通用bool
  Future<void> updateBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    bool reuslt = await prefs.setBool(key, value);
    init();
  }

  // 通用int
  Future<void> updateint(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    bool reuslt = await prefs.setInt(key, value);
    init();
  }

  // 通用double
  Future<void> updatedouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    if (key == CSLocalProvider.instance.cs_dolas_numberName) {
        // CSNoticeHelp().startSJForegroundService();
    }
    print("value= $value");
    await prefs.setDouble(key, value);
    if (key == CSLocalProvider.instance.cs_dolas_numberName && value > 0) {
      await prefs.setDouble(cs_dolas_old_numberName,  cs_dolas_old_number + value);
    }
    if (key == CSLocalProvider.instance.cs_dolas_numberName && value > 0){
      trigger.check(CSLocalProvider.instance.cs_dollar_number.toInt(), onTrigger: (level) {
        print("触发 → 达到 $level");
        cs_event_fire('cash_money_detail', {'money' : level});
      });
      await prefs.setBool(cs_show_dolas_aniName, true);
    }
    init();
  }

  // 通用String
  Future<void> updateString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    bool reuslt = await prefs.setString(key, value);
    init();
  }
}


