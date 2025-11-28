// DEBUG VERSION - UnifiedPlan with extensive logging
// This is a modified version for debugging setRemoteDescription NULL issue

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mediasfu_mediasoup_client/src/handlers/handler_interface.dart';
import 'package:mediasfu_mediasoup_client/src/handlers/unified_plan.dart';

class UnifiedPlanDebug extends UnifiedPlan {
  @override
  Future<HandlerSendResult> send(HandlerSendOptions options) async {
    print('🔍 DEBUG: UnifiedPlan.send() başladı - track: ${options.track.kind}');

    try {
      final result = await super.send(options);
      print('✅ DEBUG: UnifiedPlan.send() başarılı - localId: ${result.localId}');
      return result;
    } catch (e, stackTrace) {
      print('❌ DEBUG: UnifiedPlan.send() hatası: $e');
      print('📋 DEBUG: Stack trace: $stackTrace');
      rethrow;
    }
  }
}
