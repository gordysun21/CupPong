#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
//efine SC_DISABLE_FRUSTUM_CULLING
#define SC_ENABLE_INSTANCED_RENDERING
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler Tweak_N167SmpSC 0:25
//sampler sampler Tweak_N168SmpSC 0:26
//sampler sampler Tweak_N169SmpSC 0:27
//sampler sampler intensityTextureSmpSC 0:28
//sampler sampler sc_EnvmapDiffuseSmpSC 0:29
//sampler sampler sc_EnvmapSpecularSmpSC 0:30
//sampler sampler sc_RayTracedAoTextureSmpSC 0:32
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:33
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:34
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:35
//sampler sampler sc_SSAOTextureSmpSC 0:36
//sampler sampler sc_ScreenTextureSmpSC 0:37
//sampler sampler sc_ShadowTextureSmpSC 0:38
//sampler sampler transformPosRotTexSmpSC 0:40
//sampler sampler transformScaleTexSmpSC 0:41
//texture texture2D Tweak_N167 0:1:0:25
//texture texture2D Tweak_N168 0:2:0:26
//texture texture2D Tweak_N169 0:3:0:27
//texture texture2D intensityTexture 0:4:0:28
//texture texture2D sc_EnvmapDiffuse 0:5:0:29
//texture texture2D sc_EnvmapSpecular 0:6:0:30
//texture texture2D sc_RayTracedAoTexture 0:15:0:32
//texture texture2D sc_RayTracedDiffIndTexture 0:16:0:33
//texture texture2D sc_RayTracedReflectionTexture 0:17:0:34
//texture texture2D sc_RayTracedShadowTexture 0:18:0:35
//texture texture2D sc_SSAOTexture 0:19:0:36
//texture texture2D sc_ScreenTexture 0:20:0:37
//texture texture2D sc_ShadowTexture 0:21:0:38
//texture texture2D transformPosRotTex 0:23:0:40
//texture texture2D transformScaleTex 0:24:0:41
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:42:5488 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapDiffuseDims 1104
//float4 sc_EnvmapDiffuseView 1120
//float4 sc_EnvmapSpecularSize 1136
//float4 sc_EnvmapSpecularDims 1152
//float4 sc_EnvmapSpecularView 1168
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_GeometryInfo 1408
//float4x4 sc_ModelViewProjectionMatrixArray 1424:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1552:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1808:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2064:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2192:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2288:[2]:48
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float3x3 sc_NormalMatrixInverse 3200
//float4x4 sc_PrevFrameModelMatrix 3248
//float4x4 sc_PrevFrameModelMatrixInverse 3312
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float3 sc_WorldAabbMin 3408
//float3 sc_WorldAabbMax 3424
//float4 sc_WindowToViewportTransform 3440
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float _sc_GetFramebufferColorInvalidUsageMarker 3600
//float shaderComplexityValue 3604
//float sc_DisableFrustumCullingMarker 3608
//float4 weights0 3616
//float4 weights1 3632
//float4 weights2 3648
//float4 sc_StereoClipPlanes 3664:[2]:16
//int sc_FallbackInstanceID 3696
//float _sc_framebufferFetchMarker 3700
//float2 sc_TAAJitterOffset 3704
//float strandWidth 3712
//float strandTaper 3716
//float4 sc_StrandDataMapTextureSize 3728
//float clumpInstanceCount 3744
//float clumpRadius 3748
//float clumpTipScale 3752
//float hairstyleInstanceCount 3756
//float hairstyleNoise 3760
//float4 sc_ScreenTextureSize 3776
//float4 sc_ScreenTextureDims 3792
//float4 sc_ScreenTextureView 3808
//bool receivesRayTracedReflections 3824
//bool receivesRayTracedShadows 3828
//bool receivesRayTracedDiffuseIndirect 3832
//bool receivesRayTracedAo 3836
//float4 sc_RayTracedReflectionTextureSize 3840
//float4 sc_RayTracedReflectionTextureDims 3856
//float4 sc_RayTracedReflectionTextureView 3872
//float4 sc_RayTracedShadowTextureSize 3888
//float4 sc_RayTracedShadowTextureDims 3904
//float4 sc_RayTracedShadowTextureView 3920
//float4 sc_RayTracedDiffIndTextureSize 3936
//float4 sc_RayTracedDiffIndTextureDims 3952
//float4 sc_RayTracedDiffIndTextureView 3968
//float4 sc_RayTracedAoTextureSize 3984
//float4 sc_RayTracedAoTextureDims 4000
//float4 sc_RayTracedAoTextureView 4016
//float receiver_mask 4032
//float3 OriginNormalizationScale 4048
//float3 OriginNormalizationScaleInv 4064
//float3 OriginNormalizationOffset 4080
//int receiverId 4096
//float correctedIntensity 4100
//float4 intensityTextureSize 4112
//float4 intensityTextureDims 4128
//float4 intensityTextureView 4144
//float3x3 intensityTextureTransform 4160
//float4 intensityTextureUvMinMax 4208
//float4 intensityTextureBorderColor 4224
//float reflBlurWidth 4240
//float reflBlurMinRough 4244
//float reflBlurMaxRough 4248
//int overrideTimeEnabled 4252
//float overrideTimeElapsed 4256
//float overrideTimeDelta 4260
//int PreviewEnabled 4264
//int PreviewNodeID 4268
//float alphaTestThreshold 4272
//float4 transformPosRotTexSize 4288
//float4 transformPosRotTexDims 4304
//float4 transformPosRotTexView 4320
//float3x3 transformPosRotTexTransform 4336
//float4 transformPosRotTexUvMinMax 4384
//float4 transformPosRotTexBorderColor 4400
//float maxInstanceCount 4416
//float minPos 4420
//float maxPos 4424
//float4 transformScaleTexSize 4432
//float4 transformScaleTexDims 4448
//float4 transformScaleTexView 4464
//float3x3 transformScaleTexTransform 4480
//float4 transformScaleTexUvMinMax 4528
//float4 transformScaleTexBorderColor 4544
//float minSca 4560
//float maxSca 4564
//float Tweak_N112 4568
//float Tweak_N110 4572
//float Tweak_N111 4576
//float minRot 4580
//float maxRot 4584
//float Tweak_N144 4588
//float Tweak_N142 4592
//float Tweak_N143 4596
//float4 Tweak_N167Size 4608
//float4 Tweak_N167Dims 4624
//float4 Tweak_N167View 4640
//float3x3 Tweak_N167Transform 4656
//float4 Tweak_N167UvMinMax 4704
//float4 Tweak_N167BorderColor 4720
//float4 Tweak_N175 4736
//float Tweak_N17 4752
//float4 Tweak_N168Size 4768
//float4 Tweak_N168Dims 4784
//float4 Tweak_N168View 4800
//float3x3 Tweak_N168Transform 4816
//float4 Tweak_N168UvMinMax 4864
//float4 Tweak_N168BorderColor 4880
//float4 Tweak_N169Size 4896
//float4 Tweak_N169Dims 4912
//float4 Tweak_N169View 4928
//float3x3 Tweak_N169Transform 4944
//float4 Tweak_N169UvMinMax 4992
//float4 Tweak_N169BorderColor 5008
//float Port_Input1_N018 5024
//float Port_Import_N125 5028
//float Port_Import_N094 5032
//float Port_Value2_N051 5036
//float Port_Import_N115 5040
//float Port_Import_N091 5044
//float Port_Import_N116 5048
//float Port_Import_N092 5052
//float Port_Value2_N052 5056
//float Port_Value2_N014 5060
//float Port_Value4_N003 5064
//float Port_Import_N109 5068
//float Port_Value2_N028 5072
//float Port_RangeMinA_N040 5076
//float Port_RangeMaxA_N040 5080
//float Port_Import_N119 5084
//float Port_Import_N106 5088
//float Port_Import_N120 5092
//float Port_Import_N107 5096
//float Port_Input1_N011 5100
//float Port_Value1_N061 5104
//float Port_Input0_N179 5108
//float Port_Import_N127 5112
//float Port_Import_N128 5116
//float Port_Multiplier_N089 5120
//float Port_Import_N130 5124
//float Port_Import_N131 5128
//float Port_Import_N135 5132
//float Port_Import_N158 5136
//float Port_Import_N140 5140
//float3 Port_Import_N096 5152
//float3 Port_Import_N039 5168
//float Port_Import_N100 5184
//float Port_Value2_N019 5188
//float Port_Import_N121 5192
//float Port_Import_N101 5196
//float Port_Import_N122 5200
//float Port_Import_N102 5204
//float Port_Value2_N026 5208
//float4 Port_Import_N041 5216
//float Port_Input1_N037 5232
//float3 Port_Import_N090 5248
//float3 Port_Input0_N178 5264
//float Port_Value1_N162 5280
//float Port_Import_N146 5284
//float Port_Import_N147 5288
//float Port_Import_N149 5292
//float Port_Import_N150 5296
//float Port_Import_N154 5300
//float Port_Value3_N162 5304
//float3 Port_Import_N161 5312
//float3 Port_Import_N160 5328
//float3 Port_Import_N075 5344
//float4 Port_Import_N076 5360
//float Port_Input1_N083 5376
//float3 Port_Import_N063 5392
//float4 Port_Import_N064 5408
//float Port_Input1_N071 5424
//float4 Port_Default_N176 5440
//float3 Port_Emissive_N174 5456
//float3 Port_SpecularAO_N174 5472
//}
//spec_const bool BLEND_MODE_AVERAGE 0
//spec_const bool BLEND_MODE_BRIGHT 1
//spec_const bool BLEND_MODE_COLOR_BURN 2
//spec_const bool BLEND_MODE_COLOR_DODGE 3
//spec_const bool BLEND_MODE_COLOR 4
//spec_const bool BLEND_MODE_DARKEN 5
//spec_const bool BLEND_MODE_DIFFERENCE 6
//spec_const bool BLEND_MODE_DIVIDE 7
//spec_const bool BLEND_MODE_DIVISION 8
//spec_const bool BLEND_MODE_EXCLUSION 9
//spec_const bool BLEND_MODE_FORGRAY 10
//spec_const bool BLEND_MODE_HARD_GLOW 11
//spec_const bool BLEND_MODE_HARD_LIGHT 12
//spec_const bool BLEND_MODE_HARD_MIX 13
//spec_const bool BLEND_MODE_HARD_PHOENIX 14
//spec_const bool BLEND_MODE_HARD_REFLECT 15
//spec_const bool BLEND_MODE_HUE 16
//spec_const bool BLEND_MODE_INTENSE 17
//spec_const bool BLEND_MODE_LIGHTEN 18
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19
//spec_const bool BLEND_MODE_LUMINOSITY 20
//spec_const bool BLEND_MODE_NEGATION 21
//spec_const bool BLEND_MODE_NOTBRIGHT 22
//spec_const bool BLEND_MODE_OVERLAY 23
//spec_const bool BLEND_MODE_PIN_LIGHT 24
//spec_const bool BLEND_MODE_REALISTIC 25
//spec_const bool BLEND_MODE_SATURATION 26
//spec_const bool BLEND_MODE_SOFT_LIGHT 27
//spec_const bool BLEND_MODE_SUBTRACT 28
//spec_const bool BLEND_MODE_VIVID_LIGHT 29
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N167 31
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N168 32
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N169 33
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34
//spec_const bool SC_USE_CLAMP_TO_BORDER_transformPosRotTex 35
//spec_const bool SC_USE_CLAMP_TO_BORDER_transformScaleTex 36
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N167 37
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N168 38
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N169 39
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 40
//spec_const bool SC_USE_UV_MIN_MAX_transformPosRotTex 41
//spec_const bool SC_USE_UV_MIN_MAX_transformScaleTex 42
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N167 43
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N168 44
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N169 45
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 46
//spec_const bool SC_USE_UV_TRANSFORM_transformPosRotTex 47
//spec_const bool SC_USE_UV_TRANSFORM_transformScaleTex 48
//spec_const bool Tweak_N163 49
//spec_const bool Tweak_N166 50
//spec_const bool Tweak_N167HasSwappedViews 51
//spec_const bool Tweak_N168HasSwappedViews 52
//spec_const bool Tweak_N169HasSwappedViews 53
//spec_const bool Tweak_N177 54
//spec_const bool Tweak_N45 55
//spec_const bool UseViewSpaceDepthVariant 56
//spec_const bool intensityTextureHasSwappedViews 57
//spec_const bool sc_BlendMode_AddWithAlphaFactor 58
//spec_const bool sc_BlendMode_Add 59
//spec_const bool sc_BlendMode_AlphaTest 60
//spec_const bool sc_BlendMode_AlphaToCoverage 61
//spec_const bool sc_BlendMode_ColoredGlass 62
//spec_const bool sc_BlendMode_Custom 63
//spec_const bool sc_BlendMode_Max 64
//spec_const bool sc_BlendMode_Min 65
//spec_const bool sc_BlendMode_MultiplyOriginal 66
//spec_const bool sc_BlendMode_Multiply 67
//spec_const bool sc_BlendMode_Normal 68
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 69
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 70
//spec_const bool sc_BlendMode_PremultipliedAlpha 71
//spec_const bool sc_BlendMode_Screen 72
//spec_const bool sc_DepthOnly 73
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 74
//spec_const bool sc_EnvmapSpecularHasSwappedViews 75
//spec_const bool sc_FramebufferFetch 76
//spec_const bool sc_HasDiffuseEnvmap 77
//spec_const bool sc_LightEstimation 78
//spec_const bool sc_MotionVectorsPass 79
//spec_const bool sc_OITCompositingPass 80
//spec_const bool sc_OITDepthBoundsPass 81
//spec_const bool sc_OITDepthGatherPass 82
//spec_const bool sc_ProjectiveShadowsCaster 83
//spec_const bool sc_ProjectiveShadowsReceiver 84
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 85
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 86
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 87
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 88
//spec_const bool sc_RenderAlphaToColor 89
//spec_const bool sc_SSAOEnabled 90
//spec_const bool sc_ScreenTextureHasSwappedViews 91
//spec_const bool sc_ShaderComplexityAnalyzer 92
//spec_const bool sc_UseFramebufferFetchMarker 93
//spec_const bool sc_VertexBlendingUseNormals 94
//spec_const bool sc_VertexBlending 95
//spec_const bool transformPosRotTexHasSwappedViews 96
//spec_const bool transformScaleTexHasSwappedViews 97
//spec_const int SC_DEVICE_CLASS 98
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N167 99
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N168 100
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N169 101
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 102
//spec_const int SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex 103
//spec_const int SC_SOFTWARE_WRAP_MODE_U_transformScaleTex 104
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N167 105
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N168 106
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N169 107
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 108
//spec_const int SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex 109
//spec_const int SC_SOFTWARE_WRAP_MODE_V_transformScaleTex 110
//spec_const int Tweak_N167Layout 111
//spec_const int Tweak_N168Layout 112
//spec_const int Tweak_N169Layout 113
//spec_const int intensityTextureLayout 114
//spec_const int sc_AmbientLightMode0 115
//spec_const int sc_AmbientLightMode1 116
//spec_const int sc_AmbientLightMode2 117
//spec_const int sc_AmbientLightMode_Constant 118
//spec_const int sc_AmbientLightMode_EnvironmentMap 119
//spec_const int sc_AmbientLightMode_FromCamera 120
//spec_const int sc_AmbientLightMode_SphericalHarmonics 121
//spec_const int sc_AmbientLightsCount 122
//spec_const int sc_DepthBufferMode 123
//spec_const int sc_DirectionalLightsCount 124
//spec_const int sc_EnvLightMode 125
//spec_const int sc_EnvmapDiffuseLayout 126
//spec_const int sc_EnvmapSpecularLayout 127
//spec_const int sc_LightEstimationSGCount 128
//spec_const int sc_MaxTextureImageUnits 129
//spec_const int sc_PointLightsCount 130
//spec_const int sc_RayTracedAoTextureLayout 131
//spec_const int sc_RayTracedDiffIndTextureLayout 132
//spec_const int sc_RayTracedReflectionTextureLayout 133
//spec_const int sc_RayTracedShadowTextureLayout 134
//spec_const int sc_RenderingSpace 135
//spec_const int sc_ScreenTextureLayout 136
//spec_const int sc_ShaderCacheConstant 137
//spec_const int sc_SkinBonesCount 138
//spec_const int sc_StereoRenderingMode 139
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 140
//spec_const int transformPosRotTexLayout 141
//spec_const int transformScaleTexLayout 142
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N167 [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N167_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N167) ? SC_USE_CLAMP_TO_BORDER_Tweak_N167 : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N168 [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N168_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N168) ? SC_USE_CLAMP_TO_BORDER_Tweak_N168 : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N169 [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N169_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N169) ? SC_USE_CLAMP_TO_BORDER_Tweak_N169 : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_transformPosRotTex [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_transformPosRotTex) ? SC_USE_CLAMP_TO_BORDER_transformPosRotTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_transformScaleTex [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_transformScaleTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_transformScaleTex) ? SC_USE_CLAMP_TO_BORDER_transformScaleTex : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N167 [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N167_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N167) ? SC_USE_UV_MIN_MAX_Tweak_N167 : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N168 [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N168_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N168) ? SC_USE_UV_MIN_MAX_Tweak_N168 : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N169 [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N169_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N169) ? SC_USE_UV_MIN_MAX_Tweak_N169 : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_transformPosRotTex [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_transformPosRotTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_transformPosRotTex) ? SC_USE_UV_MIN_MAX_transformPosRotTex : false;
constant bool SC_USE_UV_MIN_MAX_transformScaleTex [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_transformScaleTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_transformScaleTex) ? SC_USE_UV_MIN_MAX_transformScaleTex : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N167 [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N167_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N167) ? SC_USE_UV_TRANSFORM_Tweak_N167 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N168 [[function_constant(44)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N168_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N168) ? SC_USE_UV_TRANSFORM_Tweak_N168 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N169 [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N169_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N169) ? SC_USE_UV_TRANSFORM_Tweak_N169 : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(46)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_transformPosRotTex [[function_constant(47)]];
constant bool SC_USE_UV_TRANSFORM_transformPosRotTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_transformPosRotTex) ? SC_USE_UV_TRANSFORM_transformPosRotTex : false;
constant bool SC_USE_UV_TRANSFORM_transformScaleTex [[function_constant(48)]];
constant bool SC_USE_UV_TRANSFORM_transformScaleTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_transformScaleTex) ? SC_USE_UV_TRANSFORM_transformScaleTex : false;
constant bool Tweak_N163 [[function_constant(49)]];
constant bool Tweak_N163_tmp = is_function_constant_defined(Tweak_N163) ? Tweak_N163 : false;
constant bool Tweak_N166 [[function_constant(50)]];
constant bool Tweak_N166_tmp = is_function_constant_defined(Tweak_N166) ? Tweak_N166 : false;
constant bool Tweak_N167HasSwappedViews [[function_constant(51)]];
constant bool Tweak_N167HasSwappedViews_tmp = is_function_constant_defined(Tweak_N167HasSwappedViews) ? Tweak_N167HasSwappedViews : false;
constant bool Tweak_N168HasSwappedViews [[function_constant(52)]];
constant bool Tweak_N168HasSwappedViews_tmp = is_function_constant_defined(Tweak_N168HasSwappedViews) ? Tweak_N168HasSwappedViews : false;
constant bool Tweak_N169HasSwappedViews [[function_constant(53)]];
constant bool Tweak_N169HasSwappedViews_tmp = is_function_constant_defined(Tweak_N169HasSwappedViews) ? Tweak_N169HasSwappedViews : false;
constant bool Tweak_N177 [[function_constant(54)]];
constant bool Tweak_N177_tmp = is_function_constant_defined(Tweak_N177) ? Tweak_N177 : false;
constant bool Tweak_N45 [[function_constant(55)]];
constant bool Tweak_N45_tmp = is_function_constant_defined(Tweak_N45) ? Tweak_N45 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(56)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(57)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(58)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(59)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(60)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(61)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(62)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(63)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(64)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(65)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(66)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(67)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(68)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(69)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(70)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(71)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(72)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(73)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(74)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(75)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(76)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(77)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(78)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(79)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(80)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(81)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(82)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(83)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(84)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(85)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(86)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(87)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(88)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(89)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(90)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(91)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(92)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(93)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(94)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(95)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool transformPosRotTexHasSwappedViews [[function_constant(96)]];
constant bool transformPosRotTexHasSwappedViews_tmp = is_function_constant_defined(transformPosRotTexHasSwappedViews) ? transformPosRotTexHasSwappedViews : false;
constant bool transformScaleTexHasSwappedViews [[function_constant(97)]];
constant bool transformScaleTexHasSwappedViews_tmp = is_function_constant_defined(transformScaleTexHasSwappedViews) ? transformScaleTexHasSwappedViews : false;
constant int SC_DEVICE_CLASS [[function_constant(98)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N167 [[function_constant(99)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N167_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N167) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N167 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N168 [[function_constant(100)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N168_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N168) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N168 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N169 [[function_constant(101)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N169_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N169) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N169 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex [[function_constant(103)]];
constant int SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex) ? SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_transformScaleTex [[function_constant(104)]];
constant int SC_SOFTWARE_WRAP_MODE_U_transformScaleTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_transformScaleTex) ? SC_SOFTWARE_WRAP_MODE_U_transformScaleTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N167 [[function_constant(105)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N167_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N167) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N167 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N168 [[function_constant(106)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N168_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N168) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N168 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N169 [[function_constant(107)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N169_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N169) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N169 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(108)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex [[function_constant(109)]];
constant int SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex) ? SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_transformScaleTex [[function_constant(110)]];
constant int SC_SOFTWARE_WRAP_MODE_V_transformScaleTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_transformScaleTex) ? SC_SOFTWARE_WRAP_MODE_V_transformScaleTex : -1;
constant int Tweak_N167Layout [[function_constant(111)]];
constant int Tweak_N167Layout_tmp = is_function_constant_defined(Tweak_N167Layout) ? Tweak_N167Layout : 0;
constant int Tweak_N168Layout [[function_constant(112)]];
constant int Tweak_N168Layout_tmp = is_function_constant_defined(Tweak_N168Layout) ? Tweak_N168Layout : 0;
constant int Tweak_N169Layout [[function_constant(113)]];
constant int Tweak_N169Layout_tmp = is_function_constant_defined(Tweak_N169Layout) ? Tweak_N169Layout : 0;
constant int intensityTextureLayout [[function_constant(114)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(115)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(116)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(117)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(118)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(119)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(120)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(121)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(122)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(123)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(124)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(125)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(126)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(127)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(128)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(129)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(130)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(131)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(132)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(133)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(134)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(135)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(136)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(137)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(138)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(139)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(140)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int transformPosRotTexLayout [[function_constant(141)]];
constant int transformPosRotTexLayout_tmp = is_function_constant_defined(transformPosRotTexLayout) ? transformPosRotTexLayout : 0;
constant int transformScaleTexLayout [[function_constant(142)]];
constant int transformScaleTexLayout_tmp = is_function_constant_defined(transformScaleTexLayout) ? transformScaleTexLayout : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexTangent_ObjectSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 transformPosRotTexSize;
float4 transformPosRotTexDims;
float4 transformPosRotTexView;
float3x3 transformPosRotTexTransform;
float4 transformPosRotTexUvMinMax;
float4 transformPosRotTexBorderColor;
float maxInstanceCount;
float minPos;
float maxPos;
float4 transformScaleTexSize;
float4 transformScaleTexDims;
float4 transformScaleTexView;
float3x3 transformScaleTexTransform;
float4 transformScaleTexUvMinMax;
float4 transformScaleTexBorderColor;
float minSca;
float maxSca;
float Tweak_N112;
float Tweak_N110;
float Tweak_N111;
float minRot;
float maxRot;
float Tweak_N144;
float Tweak_N142;
float Tweak_N143;
float4 Tweak_N167Size;
float4 Tweak_N167Dims;
float4 Tweak_N167View;
float3x3 Tweak_N167Transform;
float4 Tweak_N167UvMinMax;
float4 Tweak_N167BorderColor;
float4 Tweak_N175;
float Tweak_N17;
float4 Tweak_N168Size;
float4 Tweak_N168Dims;
float4 Tweak_N168View;
float3x3 Tweak_N168Transform;
float4 Tweak_N168UvMinMax;
float4 Tweak_N168BorderColor;
float4 Tweak_N169Size;
float4 Tweak_N169Dims;
float4 Tweak_N169View;
float3x3 Tweak_N169Transform;
float4 Tweak_N169UvMinMax;
float4 Tweak_N169BorderColor;
float Port_Input1_N018;
float Port_Import_N125;
float Port_Import_N094;
float Port_Value2_N051;
float Port_Import_N115;
float Port_Import_N091;
float Port_Import_N116;
float Port_Import_N092;
float Port_Value2_N052;
float Port_Value2_N014;
float Port_Value4_N003;
float Port_Import_N109;
float Port_Value2_N028;
float Port_RangeMinA_N040;
float Port_RangeMaxA_N040;
float Port_Import_N119;
float Port_Import_N106;
float Port_Import_N120;
float Port_Import_N107;
float Port_Input1_N011;
float Port_Value1_N061;
float Port_Input0_N179;
float Port_Import_N127;
float Port_Import_N128;
float Port_Multiplier_N089;
float Port_Import_N130;
float Port_Import_N131;
float Port_Import_N135;
float Port_Import_N158;
float Port_Import_N140;
float3 Port_Import_N096;
float3 Port_Import_N039;
float Port_Import_N100;
float Port_Value2_N019;
float Port_Import_N121;
float Port_Import_N101;
float Port_Import_N122;
float Port_Import_N102;
float Port_Value2_N026;
float4 Port_Import_N041;
float Port_Input1_N037;
float3 Port_Import_N090;
float3 Port_Input0_N178;
float Port_Value1_N162;
float Port_Import_N146;
float Port_Import_N147;
float Port_Import_N149;
float Port_Import_N150;
float Port_Import_N154;
float Port_Value3_N162;
float3 Port_Import_N161;
float3 Port_Import_N160;
float3 Port_Import_N075;
float4 Port_Import_N076;
float Port_Input1_N083;
float3 Port_Import_N063;
float4 Port_Import_N064;
float Port_Input1_N071;
float4 Port_Default_N176;
float3 Port_Emissive_N174;
float3 Port_SpecularAO_N174;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> Tweak_N167 [[id(1)]];
texture2d<float> Tweak_N168 [[id(2)]];
texture2d<float> Tweak_N169 [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracedAoTexture [[id(15)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(16)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(17)]];
texture2d<float> sc_RayTracedShadowTexture [[id(18)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
texture2d<float> sc_ShadowTexture [[id(21)]];
texture2d<float> transformPosRotTex [[id(23)]];
texture2d<float> transformScaleTex [[id(24)]];
sampler Tweak_N167SmpSC [[id(25)]];
sampler Tweak_N168SmpSC [[id(26)]];
sampler Tweak_N169SmpSC [[id(27)]];
sampler intensityTextureSmpSC [[id(28)]];
sampler sc_EnvmapDiffuseSmpSC [[id(29)]];
sampler sc_EnvmapSpecularSmpSC [[id(30)]];
sampler sc_RayTracedAoTextureSmpSC [[id(32)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(33)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(34)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(35)]];
sampler sc_SSAOTextureSmpSC [[id(36)]];
sampler sc_ScreenTextureSmpSC [[id(37)]];
sampler sc_ShadowTextureSmpSC [[id(38)]];
sampler transformPosRotTexSmpSC [[id(40)]];
sampler transformScaleTexSmpSC [[id(41)]];
constant userUniformsObj* UserUniforms [[id(42)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set0.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set0.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set0.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set0.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set0.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set0.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=int(in.boneData.x);
int l9_56=int(in.boneData.y);
int l9_57=int(in.boneData.z);
int l9_58=int(in.boneData.w);
int l9_59=l9_55;
float4 l9_60=l9_51.position;
float3 l9_61=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_62=l9_59;
float4 l9_63=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[0];
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[1];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[2];
float4 l9_66[3];
l9_66[0]=l9_63;
l9_66[1]=l9_64;
l9_66[2]=l9_65;
l9_61=float3(dot(l9_60,l9_66[0]),dot(l9_60,l9_66[1]),dot(l9_60,l9_66[2]));
}
else
{
l9_61=l9_60.xyz;
}
float3 l9_67=l9_61;
float3 l9_68=l9_67;
float l9_69=l9_54.x;
int l9_70=l9_56;
float4 l9_71=l9_51.position;
float3 l9_72=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_73=l9_70;
float4 l9_74=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[0];
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[1];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[2];
float4 l9_77[3];
l9_77[0]=l9_74;
l9_77[1]=l9_75;
l9_77[2]=l9_76;
l9_72=float3(dot(l9_71,l9_77[0]),dot(l9_71,l9_77[1]),dot(l9_71,l9_77[2]));
}
else
{
l9_72=l9_71.xyz;
}
float3 l9_78=l9_72;
float3 l9_79=l9_78;
float l9_80=l9_54.y;
int l9_81=l9_57;
float4 l9_82=l9_51.position;
float3 l9_83=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_84=l9_81;
float4 l9_85=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[0];
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[1];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[2];
float4 l9_88[3];
l9_88[0]=l9_85;
l9_88[1]=l9_86;
l9_88[2]=l9_87;
l9_83=float3(dot(l9_82,l9_88[0]),dot(l9_82,l9_88[1]),dot(l9_82,l9_88[2]));
}
else
{
l9_83=l9_82.xyz;
}
float3 l9_89=l9_83;
float3 l9_90=l9_89;
float l9_91=l9_54.z;
int l9_92=l9_58;
float4 l9_93=l9_51.position;
float3 l9_94=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_95=l9_92;
float4 l9_96=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[0];
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[1];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[2];
float4 l9_99[3];
l9_99[0]=l9_96;
l9_99[1]=l9_97;
l9_99[2]=l9_98;
l9_94=float3(dot(l9_93,l9_99[0]),dot(l9_93,l9_99[1]),dot(l9_93,l9_99[2]));
}
else
{
l9_94=l9_93.xyz;
}
float3 l9_100=l9_94;
float3 l9_101=(((l9_68*l9_69)+(l9_79*l9_80))+(l9_90*l9_91))+(l9_100*l9_54.w);
l9_51.position=float4(l9_101.x,l9_101.y,l9_101.z,l9_51.position.w);
int l9_102=l9_55;
float3x3 l9_103=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[2].xyz));
float3x3 l9_104=l9_103;
float3x3 l9_105=l9_104;
int l9_106=l9_56;
float3x3 l9_107=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[2].xyz));
float3x3 l9_108=l9_107;
float3x3 l9_109=l9_108;
int l9_110=l9_57;
float3x3 l9_111=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[2].xyz));
float3x3 l9_112=l9_111;
float3x3 l9_113=l9_112;
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
l9_51.normal=((((l9_105*l9_51.normal)*l9_54.x)+((l9_109*l9_51.normal)*l9_54.y))+((l9_113*l9_51.normal)*l9_54.z))+((l9_117*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_105*l9_51.tangent)*l9_54.x)+((l9_109*l9_51.tangent)*l9_54.y))+((l9_113*l9_51.tangent)*l9_54.z))+((l9_117*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_118=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_118.x,l9_118.y,l9_118.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
float l9_119;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_119=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_119=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_119;
float l9_120;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_120=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_120=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_120;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPos,1.0)).xyz;
Globals.VertexNormal_WorldSpace=out.varNormal;
Globals.VertexTangent_WorldSpace=out.varTangent.xyz;
Globals.VertexTangent_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexTangent_WorldSpace,0.0)).xyz;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float InstanceID_N13=0.0;
int l9_121=gl_InstanceIndex;
InstanceID_N13=floor(float(l9_121)+0.5);
float Output_N18=0.0;
Output_N18=InstanceID_N13+(*sc_set0.UserUniforms).Port_Input1_N018;
float Output_N15=0.0;
float param_1=(*sc_set0.UserUniforms).maxInstanceCount;
Output_N15=param_1;
float Value_N125=0.0;
Value_N125=Output_N15;
float Output_N16=0.0;
Output_N16=Output_N18/(Value_N125+1.234e-06);
float Value_N94=0.0;
Value_N94=Output_N16;
float2 Value_N51=float2(0.0);
Value_N51.x=Value_N94;
Value_N51.y=(*sc_set0.UserUniforms).Port_Value2_N051;
float4 Color_N55=float4(0.0);
int l9_122=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_123=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_123=0;
}
else
{
l9_123=gl_InstanceIndex%2;
}
int l9_124=l9_123;
l9_122=1-l9_124;
}
else
{
int l9_125=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_125=0;
}
else
{
l9_125=gl_InstanceIndex%2;
}
int l9_126=l9_125;
l9_122=l9_126;
}
int l9_127=l9_122;
int param_2=transformPosRotTexLayout_tmp;
int param_3=l9_127;
float2 param_4=Value_N51;
bool param_5=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_6=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_7=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_8=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_9=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_10=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_11=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_12=0.0;
bool l9_128=param_10&&(!param_8);
float l9_129=1.0;
float l9_130=param_4.x;
int l9_131=param_7.x;
if (l9_131==1)
{
l9_130=fract(l9_130);
}
else
{
if (l9_131==2)
{
float l9_132=fract(l9_130);
float l9_133=l9_130-l9_132;
float l9_134=step(0.25,fract(l9_133*0.5));
l9_130=mix(l9_132,1.0-l9_132,fast::clamp(l9_134,0.0,1.0));
}
}
param_4.x=l9_130;
float l9_135=param_4.y;
int l9_136=param_7.y;
if (l9_136==1)
{
l9_135=fract(l9_135);
}
else
{
if (l9_136==2)
{
float l9_137=fract(l9_135);
float l9_138=l9_135-l9_137;
float l9_139=step(0.25,fract(l9_138*0.5));
l9_135=mix(l9_137,1.0-l9_137,fast::clamp(l9_139,0.0,1.0));
}
}
param_4.y=l9_135;
if (param_8)
{
bool l9_140=param_10;
bool l9_141;
if (l9_140)
{
l9_141=param_7.x==3;
}
else
{
l9_141=l9_140;
}
float l9_142=param_4.x;
float l9_143=param_9.x;
float l9_144=param_9.z;
bool l9_145=l9_141;
float l9_146=l9_129;
float l9_147=fast::clamp(l9_142,l9_143,l9_144);
float l9_148=step(abs(l9_142-l9_147),9.9999997e-06);
l9_146*=(l9_148+((1.0-float(l9_145))*(1.0-l9_148)));
l9_142=l9_147;
param_4.x=l9_142;
l9_129=l9_146;
bool l9_149=param_10;
bool l9_150;
if (l9_149)
{
l9_150=param_7.y==3;
}
else
{
l9_150=l9_149;
}
float l9_151=param_4.y;
float l9_152=param_9.y;
float l9_153=param_9.w;
bool l9_154=l9_150;
float l9_155=l9_129;
float l9_156=fast::clamp(l9_151,l9_152,l9_153);
float l9_157=step(abs(l9_151-l9_156),9.9999997e-06);
l9_155*=(l9_157+((1.0-float(l9_154))*(1.0-l9_157)));
l9_151=l9_156;
param_4.y=l9_151;
l9_129=l9_155;
}
float2 l9_158=param_4;
bool l9_159=param_5;
float3x3 l9_160=param_6;
if (l9_159)
{
l9_158=float2((l9_160*float3(l9_158,1.0)).xy);
}
float2 l9_161=l9_158;
float2 l9_162=l9_161;
float2 l9_163=l9_162;
param_4=l9_163;
float l9_164=param_4.x;
int l9_165=param_7.x;
bool l9_166=l9_128;
float l9_167=l9_129;
if ((l9_165==0)||(l9_165==3))
{
float l9_168=l9_164;
float l9_169=0.0;
float l9_170=1.0;
bool l9_171=l9_166;
float l9_172=l9_167;
float l9_173=fast::clamp(l9_168,l9_169,l9_170);
float l9_174=step(abs(l9_168-l9_173),9.9999997e-06);
l9_172*=(l9_174+((1.0-float(l9_171))*(1.0-l9_174)));
l9_168=l9_173;
l9_164=l9_168;
l9_167=l9_172;
}
param_4.x=l9_164;
l9_129=l9_167;
float l9_175=param_4.y;
int l9_176=param_7.y;
bool l9_177=l9_128;
float l9_178=l9_129;
if ((l9_176==0)||(l9_176==3))
{
float l9_179=l9_175;
float l9_180=0.0;
float l9_181=1.0;
bool l9_182=l9_177;
float l9_183=l9_178;
float l9_184=fast::clamp(l9_179,l9_180,l9_181);
float l9_185=step(abs(l9_179-l9_184),9.9999997e-06);
l9_183*=(l9_185+((1.0-float(l9_182))*(1.0-l9_185)));
l9_179=l9_184;
l9_175=l9_179;
l9_178=l9_183;
}
param_4.y=l9_175;
l9_129=l9_178;
float2 l9_186=param_4;
int l9_187=param_2;
int l9_188=param_3;
float l9_189=param_12;
float2 l9_190=l9_186;
int l9_191=l9_187;
int l9_192=l9_188;
float3 l9_193=float3(0.0);
if (l9_191==0)
{
l9_193=float3(l9_190,0.0);
}
else
{
if (l9_191==1)
{
l9_193=float3(l9_190.x,(l9_190.y*0.5)+(0.5-(float(l9_192)*0.5)),0.0);
}
else
{
l9_193=float3(l9_190,float(l9_192));
}
}
float3 l9_194=l9_193;
float3 l9_195=l9_194;
float2 l9_196=l9_195.xy;
float l9_197=l9_189;
float4 l9_198=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_196,level(l9_197));
float4 l9_199=l9_198;
float4 l9_200=l9_199;
if (param_10)
{
l9_200=mix(param_11,l9_200,float4(l9_129));
}
float4 l9_201=l9_200;
Color_N55=l9_201;
float Output_N56=0.0;
float param_13=(*sc_set0.UserUniforms).minPos;
Output_N56=param_13;
float Value_N115=0.0;
Value_N115=Output_N56;
float Value_N91=0.0;
Value_N91=Value_N115;
float Output_N57=0.0;
float param_14=(*sc_set0.UserUniforms).maxPos;
Output_N57=param_14;
float Value_N116=0.0;
Value_N116=Output_N57;
float Value_N92=0.0;
Value_N92=Value_N116;
float Value1_N50=0.0;
float4 param_15=Color_N55;
float param_16=Value_N91;
float param_17=Value_N92;
float param_18=0.99998999;
float4 l9_202=param_15;
#if (1)
{
l9_202=floor((l9_202*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_203=dot(l9_202,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_204=l9_203;
float l9_205=0.0;
float l9_206=param_18;
float l9_207=param_16;
float l9_208=param_17;
float l9_209=l9_207+(((l9_204-l9_205)*(l9_208-l9_207))/(l9_206-l9_205));
float l9_210=l9_209;
Value1_N50=l9_210;
float2 Value_N52=float2(0.0);
Value_N52.x=Value_N94;
Value_N52.y=(*sc_set0.UserUniforms).Port_Value2_N052;
float4 Color_N54=float4(0.0);
int l9_211=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_212=0;
}
else
{
l9_212=gl_InstanceIndex%2;
}
int l9_213=l9_212;
l9_211=1-l9_213;
}
else
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=gl_InstanceIndex%2;
}
int l9_215=l9_214;
l9_211=l9_215;
}
int l9_216=l9_211;
int param_19=transformPosRotTexLayout_tmp;
int param_20=l9_216;
float2 param_21=Value_N52;
bool param_22=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_23=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_24=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_25=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_26=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_27=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_28=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_29=0.0;
bool l9_217=param_27&&(!param_25);
float l9_218=1.0;
float l9_219=param_21.x;
int l9_220=param_24.x;
if (l9_220==1)
{
l9_219=fract(l9_219);
}
else
{
if (l9_220==2)
{
float l9_221=fract(l9_219);
float l9_222=l9_219-l9_221;
float l9_223=step(0.25,fract(l9_222*0.5));
l9_219=mix(l9_221,1.0-l9_221,fast::clamp(l9_223,0.0,1.0));
}
}
param_21.x=l9_219;
float l9_224=param_21.y;
int l9_225=param_24.y;
if (l9_225==1)
{
l9_224=fract(l9_224);
}
else
{
if (l9_225==2)
{
float l9_226=fract(l9_224);
float l9_227=l9_224-l9_226;
float l9_228=step(0.25,fract(l9_227*0.5));
l9_224=mix(l9_226,1.0-l9_226,fast::clamp(l9_228,0.0,1.0));
}
}
param_21.y=l9_224;
if (param_25)
{
bool l9_229=param_27;
bool l9_230;
if (l9_229)
{
l9_230=param_24.x==3;
}
else
{
l9_230=l9_229;
}
float l9_231=param_21.x;
float l9_232=param_26.x;
float l9_233=param_26.z;
bool l9_234=l9_230;
float l9_235=l9_218;
float l9_236=fast::clamp(l9_231,l9_232,l9_233);
float l9_237=step(abs(l9_231-l9_236),9.9999997e-06);
l9_235*=(l9_237+((1.0-float(l9_234))*(1.0-l9_237)));
l9_231=l9_236;
param_21.x=l9_231;
l9_218=l9_235;
bool l9_238=param_27;
bool l9_239;
if (l9_238)
{
l9_239=param_24.y==3;
}
else
{
l9_239=l9_238;
}
float l9_240=param_21.y;
float l9_241=param_26.y;
float l9_242=param_26.w;
bool l9_243=l9_239;
float l9_244=l9_218;
float l9_245=fast::clamp(l9_240,l9_241,l9_242);
float l9_246=step(abs(l9_240-l9_245),9.9999997e-06);
l9_244*=(l9_246+((1.0-float(l9_243))*(1.0-l9_246)));
l9_240=l9_245;
param_21.y=l9_240;
l9_218=l9_244;
}
float2 l9_247=param_21;
bool l9_248=param_22;
float3x3 l9_249=param_23;
if (l9_248)
{
l9_247=float2((l9_249*float3(l9_247,1.0)).xy);
}
float2 l9_250=l9_247;
float2 l9_251=l9_250;
float2 l9_252=l9_251;
param_21=l9_252;
float l9_253=param_21.x;
int l9_254=param_24.x;
bool l9_255=l9_217;
float l9_256=l9_218;
if ((l9_254==0)||(l9_254==3))
{
float l9_257=l9_253;
float l9_258=0.0;
float l9_259=1.0;
bool l9_260=l9_255;
float l9_261=l9_256;
float l9_262=fast::clamp(l9_257,l9_258,l9_259);
float l9_263=step(abs(l9_257-l9_262),9.9999997e-06);
l9_261*=(l9_263+((1.0-float(l9_260))*(1.0-l9_263)));
l9_257=l9_262;
l9_253=l9_257;
l9_256=l9_261;
}
param_21.x=l9_253;
l9_218=l9_256;
float l9_264=param_21.y;
int l9_265=param_24.y;
bool l9_266=l9_217;
float l9_267=l9_218;
if ((l9_265==0)||(l9_265==3))
{
float l9_268=l9_264;
float l9_269=0.0;
float l9_270=1.0;
bool l9_271=l9_266;
float l9_272=l9_267;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_264=l9_268;
l9_267=l9_272;
}
param_21.y=l9_264;
l9_218=l9_267;
float2 l9_275=param_21;
int l9_276=param_19;
int l9_277=param_20;
float l9_278=param_29;
float2 l9_279=l9_275;
int l9_280=l9_276;
int l9_281=l9_277;
float3 l9_282=float3(0.0);
if (l9_280==0)
{
l9_282=float3(l9_279,0.0);
}
else
{
if (l9_280==1)
{
l9_282=float3(l9_279.x,(l9_279.y*0.5)+(0.5-(float(l9_281)*0.5)),0.0);
}
else
{
l9_282=float3(l9_279,float(l9_281));
}
}
float3 l9_283=l9_282;
float3 l9_284=l9_283;
float2 l9_285=l9_284.xy;
float l9_286=l9_278;
float4 l9_287=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_285,level(l9_286));
float4 l9_288=l9_287;
float4 l9_289=l9_288;
if (param_27)
{
l9_289=mix(param_28,l9_289,float4(l9_218));
}
float4 l9_290=l9_289;
Color_N54=l9_290;
float Value1_N2=0.0;
float4 param_30=Color_N54;
float param_31=Value_N91;
float param_32=Value_N92;
float param_33=0.99998999;
float4 l9_291=param_30;
#if (1)
{
l9_291=floor((l9_291*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_292=dot(l9_291,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_293=l9_292;
float l9_294=0.0;
float l9_295=param_33;
float l9_296=param_31;
float l9_297=param_32;
float l9_298=l9_296+(((l9_293-l9_294)*(l9_297-l9_296))/(l9_295-l9_294));
float l9_299=l9_298;
Value1_N2=l9_299;
float2 Value_N14=float2(0.0);
Value_N14.x=Value_N94;
Value_N14.y=(*sc_set0.UserUniforms).Port_Value2_N014;
float4 Color_N1=float4(0.0);
int l9_300=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_301=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_301=0;
}
else
{
l9_301=gl_InstanceIndex%2;
}
int l9_302=l9_301;
l9_300=1-l9_302;
}
else
{
int l9_303=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_303=0;
}
else
{
l9_303=gl_InstanceIndex%2;
}
int l9_304=l9_303;
l9_300=l9_304;
}
int l9_305=l9_300;
int param_34=transformPosRotTexLayout_tmp;
int param_35=l9_305;
float2 param_36=Value_N14;
bool param_37=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_38=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_39=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_40=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_41=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_42=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_43=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_44=0.0;
bool l9_306=param_42&&(!param_40);
float l9_307=1.0;
float l9_308=param_36.x;
int l9_309=param_39.x;
if (l9_309==1)
{
l9_308=fract(l9_308);
}
else
{
if (l9_309==2)
{
float l9_310=fract(l9_308);
float l9_311=l9_308-l9_310;
float l9_312=step(0.25,fract(l9_311*0.5));
l9_308=mix(l9_310,1.0-l9_310,fast::clamp(l9_312,0.0,1.0));
}
}
param_36.x=l9_308;
float l9_313=param_36.y;
int l9_314=param_39.y;
if (l9_314==1)
{
l9_313=fract(l9_313);
}
else
{
if (l9_314==2)
{
float l9_315=fract(l9_313);
float l9_316=l9_313-l9_315;
float l9_317=step(0.25,fract(l9_316*0.5));
l9_313=mix(l9_315,1.0-l9_315,fast::clamp(l9_317,0.0,1.0));
}
}
param_36.y=l9_313;
if (param_40)
{
bool l9_318=param_42;
bool l9_319;
if (l9_318)
{
l9_319=param_39.x==3;
}
else
{
l9_319=l9_318;
}
float l9_320=param_36.x;
float l9_321=param_41.x;
float l9_322=param_41.z;
bool l9_323=l9_319;
float l9_324=l9_307;
float l9_325=fast::clamp(l9_320,l9_321,l9_322);
float l9_326=step(abs(l9_320-l9_325),9.9999997e-06);
l9_324*=(l9_326+((1.0-float(l9_323))*(1.0-l9_326)));
l9_320=l9_325;
param_36.x=l9_320;
l9_307=l9_324;
bool l9_327=param_42;
bool l9_328;
if (l9_327)
{
l9_328=param_39.y==3;
}
else
{
l9_328=l9_327;
}
float l9_329=param_36.y;
float l9_330=param_41.y;
float l9_331=param_41.w;
bool l9_332=l9_328;
float l9_333=l9_307;
float l9_334=fast::clamp(l9_329,l9_330,l9_331);
float l9_335=step(abs(l9_329-l9_334),9.9999997e-06);
l9_333*=(l9_335+((1.0-float(l9_332))*(1.0-l9_335)));
l9_329=l9_334;
param_36.y=l9_329;
l9_307=l9_333;
}
float2 l9_336=param_36;
bool l9_337=param_37;
float3x3 l9_338=param_38;
if (l9_337)
{
l9_336=float2((l9_338*float3(l9_336,1.0)).xy);
}
float2 l9_339=l9_336;
float2 l9_340=l9_339;
float2 l9_341=l9_340;
param_36=l9_341;
float l9_342=param_36.x;
int l9_343=param_39.x;
bool l9_344=l9_306;
float l9_345=l9_307;
if ((l9_343==0)||(l9_343==3))
{
float l9_346=l9_342;
float l9_347=0.0;
float l9_348=1.0;
bool l9_349=l9_344;
float l9_350=l9_345;
float l9_351=fast::clamp(l9_346,l9_347,l9_348);
float l9_352=step(abs(l9_346-l9_351),9.9999997e-06);
l9_350*=(l9_352+((1.0-float(l9_349))*(1.0-l9_352)));
l9_346=l9_351;
l9_342=l9_346;
l9_345=l9_350;
}
param_36.x=l9_342;
l9_307=l9_345;
float l9_353=param_36.y;
int l9_354=param_39.y;
bool l9_355=l9_306;
float l9_356=l9_307;
if ((l9_354==0)||(l9_354==3))
{
float l9_357=l9_353;
float l9_358=0.0;
float l9_359=1.0;
bool l9_360=l9_355;
float l9_361=l9_356;
float l9_362=fast::clamp(l9_357,l9_358,l9_359);
float l9_363=step(abs(l9_357-l9_362),9.9999997e-06);
l9_361*=(l9_363+((1.0-float(l9_360))*(1.0-l9_363)));
l9_357=l9_362;
l9_353=l9_357;
l9_356=l9_361;
}
param_36.y=l9_353;
l9_307=l9_356;
float2 l9_364=param_36;
int l9_365=param_34;
int l9_366=param_35;
float l9_367=param_44;
float2 l9_368=l9_364;
int l9_369=l9_365;
int l9_370=l9_366;
float3 l9_371=float3(0.0);
if (l9_369==0)
{
l9_371=float3(l9_368,0.0);
}
else
{
if (l9_369==1)
{
l9_371=float3(l9_368.x,(l9_368.y*0.5)+(0.5-(float(l9_370)*0.5)),0.0);
}
else
{
l9_371=float3(l9_368,float(l9_370));
}
}
float3 l9_372=l9_371;
float3 l9_373=l9_372;
float2 l9_374=l9_373.xy;
float l9_375=l9_367;
float4 l9_376=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_374,level(l9_375));
float4 l9_377=l9_376;
float4 l9_378=l9_377;
if (param_42)
{
l9_378=mix(param_43,l9_378,float4(l9_307));
}
float4 l9_379=l9_378;
Color_N1=l9_379;
float Value1_N53=0.0;
float4 param_45=Color_N1;
float param_46=Value_N91;
float param_47=Value_N92;
float param_48=0.99998999;
float4 l9_380=param_45;
#if (1)
{
l9_380=floor((l9_380*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_381=dot(l9_380,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_382=l9_381;
float l9_383=0.0;
float l9_384=param_48;
float l9_385=param_46;
float l9_386=param_47;
float l9_387=l9_385+(((l9_382-l9_383)*(l9_386-l9_385))/(l9_384-l9_383));
float l9_388=l9_387;
Value1_N53=l9_388;
float4 Value_N3=float4(0.0);
Value_N3.x=Value1_N50;
Value_N3.y=Value1_N2;
Value_N3.z=Value1_N53;
Value_N3.w=(*sc_set0.UserUniforms).Port_Value4_N003;
float3 Position_N5=float3(0.0);
Position_N5=Globals.SurfacePosition_ObjectSpace;
float Result_N61=0.0;
float param_49=0.0;
float param_50=(*sc_set0.UserUniforms).Port_Value1_N061;
float param_51=0.0;
ssGlobals param_53=Globals;
float l9_389=0.0;
int l9_390=gl_InstanceIndex;
l9_389=floor(float(l9_390)+0.5);
float l9_391=0.0;
l9_391=l9_389+(*sc_set0.UserUniforms).Port_Input1_N018;
float l9_392=0.0;
float l9_393=(*sc_set0.UserUniforms).maxInstanceCount;
l9_392=l9_393;
float l9_394=0.0;
l9_394=l9_392;
float l9_395=0.0;
l9_395=l9_391/(l9_394+1.234e-06);
float l9_396=0.0;
l9_396=l9_395;
float2 l9_397=float2(0.0);
l9_397.x=l9_396;
l9_397.y=(*sc_set0.UserUniforms).Port_Value2_N028;
float4 l9_398=float4(0.0);
int l9_399=0;
if ((int(transformScaleTexHasSwappedViews_tmp)!=0))
{
int l9_400=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_400=0;
}
else
{
l9_400=gl_InstanceIndex%2;
}
int l9_401=l9_400;
l9_399=1-l9_401;
}
else
{
int l9_402=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_402=0;
}
else
{
l9_402=gl_InstanceIndex%2;
}
int l9_403=l9_402;
l9_399=l9_403;
}
int l9_404=l9_399;
int l9_405=transformScaleTexLayout_tmp;
int l9_406=l9_404;
float2 l9_407=l9_397;
bool l9_408=(int(SC_USE_UV_TRANSFORM_transformScaleTex_tmp)!=0);
float3x3 l9_409=(*sc_set0.UserUniforms).transformScaleTexTransform;
int2 l9_410=int2(SC_SOFTWARE_WRAP_MODE_U_transformScaleTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformScaleTex_tmp);
bool l9_411=(int(SC_USE_UV_MIN_MAX_transformScaleTex_tmp)!=0);
float4 l9_412=(*sc_set0.UserUniforms).transformScaleTexUvMinMax;
bool l9_413=(int(SC_USE_CLAMP_TO_BORDER_transformScaleTex_tmp)!=0);
float4 l9_414=(*sc_set0.UserUniforms).transformScaleTexBorderColor;
float l9_415=0.0;
bool l9_416=l9_413&&(!l9_411);
float l9_417=1.0;
float l9_418=l9_407.x;
int l9_419=l9_410.x;
if (l9_419==1)
{
l9_418=fract(l9_418);
}
else
{
if (l9_419==2)
{
float l9_420=fract(l9_418);
float l9_421=l9_418-l9_420;
float l9_422=step(0.25,fract(l9_421*0.5));
l9_418=mix(l9_420,1.0-l9_420,fast::clamp(l9_422,0.0,1.0));
}
}
l9_407.x=l9_418;
float l9_423=l9_407.y;
int l9_424=l9_410.y;
if (l9_424==1)
{
l9_423=fract(l9_423);
}
else
{
if (l9_424==2)
{
float l9_425=fract(l9_423);
float l9_426=l9_423-l9_425;
float l9_427=step(0.25,fract(l9_426*0.5));
l9_423=mix(l9_425,1.0-l9_425,fast::clamp(l9_427,0.0,1.0));
}
}
l9_407.y=l9_423;
if (l9_411)
{
bool l9_428=l9_413;
bool l9_429;
if (l9_428)
{
l9_429=l9_410.x==3;
}
else
{
l9_429=l9_428;
}
float l9_430=l9_407.x;
float l9_431=l9_412.x;
float l9_432=l9_412.z;
bool l9_433=l9_429;
float l9_434=l9_417;
float l9_435=fast::clamp(l9_430,l9_431,l9_432);
float l9_436=step(abs(l9_430-l9_435),9.9999997e-06);
l9_434*=(l9_436+((1.0-float(l9_433))*(1.0-l9_436)));
l9_430=l9_435;
l9_407.x=l9_430;
l9_417=l9_434;
bool l9_437=l9_413;
bool l9_438;
if (l9_437)
{
l9_438=l9_410.y==3;
}
else
{
l9_438=l9_437;
}
float l9_439=l9_407.y;
float l9_440=l9_412.y;
float l9_441=l9_412.w;
bool l9_442=l9_438;
float l9_443=l9_417;
float l9_444=fast::clamp(l9_439,l9_440,l9_441);
float l9_445=step(abs(l9_439-l9_444),9.9999997e-06);
l9_443*=(l9_445+((1.0-float(l9_442))*(1.0-l9_445)));
l9_439=l9_444;
l9_407.y=l9_439;
l9_417=l9_443;
}
float2 l9_446=l9_407;
bool l9_447=l9_408;
float3x3 l9_448=l9_409;
if (l9_447)
{
l9_446=float2((l9_448*float3(l9_446,1.0)).xy);
}
float2 l9_449=l9_446;
float2 l9_450=l9_449;
float2 l9_451=l9_450;
l9_407=l9_451;
float l9_452=l9_407.x;
int l9_453=l9_410.x;
bool l9_454=l9_416;
float l9_455=l9_417;
if ((l9_453==0)||(l9_453==3))
{
float l9_456=l9_452;
float l9_457=0.0;
float l9_458=1.0;
bool l9_459=l9_454;
float l9_460=l9_455;
float l9_461=fast::clamp(l9_456,l9_457,l9_458);
float l9_462=step(abs(l9_456-l9_461),9.9999997e-06);
l9_460*=(l9_462+((1.0-float(l9_459))*(1.0-l9_462)));
l9_456=l9_461;
l9_452=l9_456;
l9_455=l9_460;
}
l9_407.x=l9_452;
l9_417=l9_455;
float l9_463=l9_407.y;
int l9_464=l9_410.y;
bool l9_465=l9_416;
float l9_466=l9_417;
if ((l9_464==0)||(l9_464==3))
{
float l9_467=l9_463;
float l9_468=0.0;
float l9_469=1.0;
bool l9_470=l9_465;
float l9_471=l9_466;
float l9_472=fast::clamp(l9_467,l9_468,l9_469);
float l9_473=step(abs(l9_467-l9_472),9.9999997e-06);
l9_471*=(l9_473+((1.0-float(l9_470))*(1.0-l9_473)));
l9_467=l9_472;
l9_463=l9_467;
l9_466=l9_471;
}
l9_407.y=l9_463;
l9_417=l9_466;
float2 l9_474=l9_407;
int l9_475=l9_405;
int l9_476=l9_406;
float l9_477=l9_415;
float2 l9_478=l9_474;
int l9_479=l9_475;
int l9_480=l9_476;
float3 l9_481=float3(0.0);
if (l9_479==0)
{
l9_481=float3(l9_478,0.0);
}
else
{
if (l9_479==1)
{
l9_481=float3(l9_478.x,(l9_478.y*0.5)+(0.5-(float(l9_480)*0.5)),0.0);
}
else
{
l9_481=float3(l9_478,float(l9_480));
}
}
float3 l9_482=l9_481;
float3 l9_483=l9_482;
float2 l9_484=l9_483.xy;
float l9_485=l9_477;
float4 l9_486=sc_set0.transformScaleTex.sample(sc_set0.transformScaleTexSmpSC,l9_484,level(l9_485));
float4 l9_487=l9_486;
float4 l9_488=l9_487;
if (l9_413)
{
l9_488=mix(l9_414,l9_488,float4(l9_417));
}
float4 l9_489=l9_488;
l9_398=l9_489;
float l9_490=0.0;
float l9_491=(*sc_set0.UserUniforms).minSca;
l9_490=l9_491;
float l9_492=0.0;
l9_492=l9_490;
float l9_493=0.0;
l9_493=l9_492;
float l9_494=0.0;
float l9_495=(*sc_set0.UserUniforms).maxSca;
l9_494=l9_495;
float l9_496=0.0;
l9_496=l9_494;
float l9_497=0.0;
l9_497=l9_496;
float l9_498=0.0;
l9_498=(((l9_398.x-(*sc_set0.UserUniforms).Port_RangeMinA_N040)/((*sc_set0.UserUniforms).Port_RangeMaxA_N040-(*sc_set0.UserUniforms).Port_RangeMinA_N040))*(l9_497-l9_493))+l9_493;
float l9_499=0.0;
l9_499=float(l9_498<(*sc_set0.UserUniforms).Port_Input1_N011);
param_49=l9_499;
float param_52;
if ((param_49*1.0)!=0.0)
{
param_52=param_50;
}
else
{
float l9_500=0.0;
int l9_501=gl_InstanceIndex;
l9_500=floor(float(l9_501)+0.5);
float l9_502=0.0;
l9_502=l9_500+(*sc_set0.UserUniforms).Port_Input1_N018;
float l9_503=0.0;
float l9_504=(*sc_set0.UserUniforms).maxInstanceCount;
l9_503=l9_504;
float l9_505=0.0;
l9_505=l9_503;
float l9_506=0.0;
l9_506=l9_502/(l9_505+1.234e-06);
float l9_507=0.0;
l9_507=l9_506;
float2 l9_508=float2(0.0);
l9_508.x=l9_507;
l9_508.y=(*sc_set0.UserUniforms).Port_Value2_N028;
float4 l9_509=float4(0.0);
int l9_510=0;
if ((int(transformScaleTexHasSwappedViews_tmp)!=0))
{
int l9_511=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_511=0;
}
else
{
l9_511=gl_InstanceIndex%2;
}
int l9_512=l9_511;
l9_510=1-l9_512;
}
else
{
int l9_513=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_513=0;
}
else
{
l9_513=gl_InstanceIndex%2;
}
int l9_514=l9_513;
l9_510=l9_514;
}
int l9_515=l9_510;
int l9_516=transformScaleTexLayout_tmp;
int l9_517=l9_515;
float2 l9_518=l9_508;
bool l9_519=(int(SC_USE_UV_TRANSFORM_transformScaleTex_tmp)!=0);
float3x3 l9_520=(*sc_set0.UserUniforms).transformScaleTexTransform;
int2 l9_521=int2(SC_SOFTWARE_WRAP_MODE_U_transformScaleTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformScaleTex_tmp);
bool l9_522=(int(SC_USE_UV_MIN_MAX_transformScaleTex_tmp)!=0);
float4 l9_523=(*sc_set0.UserUniforms).transformScaleTexUvMinMax;
bool l9_524=(int(SC_USE_CLAMP_TO_BORDER_transformScaleTex_tmp)!=0);
float4 l9_525=(*sc_set0.UserUniforms).transformScaleTexBorderColor;
float l9_526=0.0;
bool l9_527=l9_524&&(!l9_522);
float l9_528=1.0;
float l9_529=l9_518.x;
int l9_530=l9_521.x;
if (l9_530==1)
{
l9_529=fract(l9_529);
}
else
{
if (l9_530==2)
{
float l9_531=fract(l9_529);
float l9_532=l9_529-l9_531;
float l9_533=step(0.25,fract(l9_532*0.5));
l9_529=mix(l9_531,1.0-l9_531,fast::clamp(l9_533,0.0,1.0));
}
}
l9_518.x=l9_529;
float l9_534=l9_518.y;
int l9_535=l9_521.y;
if (l9_535==1)
{
l9_534=fract(l9_534);
}
else
{
if (l9_535==2)
{
float l9_536=fract(l9_534);
float l9_537=l9_534-l9_536;
float l9_538=step(0.25,fract(l9_537*0.5));
l9_534=mix(l9_536,1.0-l9_536,fast::clamp(l9_538,0.0,1.0));
}
}
l9_518.y=l9_534;
if (l9_522)
{
bool l9_539=l9_524;
bool l9_540;
if (l9_539)
{
l9_540=l9_521.x==3;
}
else
{
l9_540=l9_539;
}
float l9_541=l9_518.x;
float l9_542=l9_523.x;
float l9_543=l9_523.z;
bool l9_544=l9_540;
float l9_545=l9_528;
float l9_546=fast::clamp(l9_541,l9_542,l9_543);
float l9_547=step(abs(l9_541-l9_546),9.9999997e-06);
l9_545*=(l9_547+((1.0-float(l9_544))*(1.0-l9_547)));
l9_541=l9_546;
l9_518.x=l9_541;
l9_528=l9_545;
bool l9_548=l9_524;
bool l9_549;
if (l9_548)
{
l9_549=l9_521.y==3;
}
else
{
l9_549=l9_548;
}
float l9_550=l9_518.y;
float l9_551=l9_523.y;
float l9_552=l9_523.w;
bool l9_553=l9_549;
float l9_554=l9_528;
float l9_555=fast::clamp(l9_550,l9_551,l9_552);
float l9_556=step(abs(l9_550-l9_555),9.9999997e-06);
l9_554*=(l9_556+((1.0-float(l9_553))*(1.0-l9_556)));
l9_550=l9_555;
l9_518.y=l9_550;
l9_528=l9_554;
}
float2 l9_557=l9_518;
bool l9_558=l9_519;
float3x3 l9_559=l9_520;
if (l9_558)
{
l9_557=float2((l9_559*float3(l9_557,1.0)).xy);
}
float2 l9_560=l9_557;
float2 l9_561=l9_560;
float2 l9_562=l9_561;
l9_518=l9_562;
float l9_563=l9_518.x;
int l9_564=l9_521.x;
bool l9_565=l9_527;
float l9_566=l9_528;
if ((l9_564==0)||(l9_564==3))
{
float l9_567=l9_563;
float l9_568=0.0;
float l9_569=1.0;
bool l9_570=l9_565;
float l9_571=l9_566;
float l9_572=fast::clamp(l9_567,l9_568,l9_569);
float l9_573=step(abs(l9_567-l9_572),9.9999997e-06);
l9_571*=(l9_573+((1.0-float(l9_570))*(1.0-l9_573)));
l9_567=l9_572;
l9_563=l9_567;
l9_566=l9_571;
}
l9_518.x=l9_563;
l9_528=l9_566;
float l9_574=l9_518.y;
int l9_575=l9_521.y;
bool l9_576=l9_527;
float l9_577=l9_528;
if ((l9_575==0)||(l9_575==3))
{
float l9_578=l9_574;
float l9_579=0.0;
float l9_580=1.0;
bool l9_581=l9_576;
float l9_582=l9_577;
float l9_583=fast::clamp(l9_578,l9_579,l9_580);
float l9_584=step(abs(l9_578-l9_583),9.9999997e-06);
l9_582*=(l9_584+((1.0-float(l9_581))*(1.0-l9_584)));
l9_578=l9_583;
l9_574=l9_578;
l9_577=l9_582;
}
l9_518.y=l9_574;
l9_528=l9_577;
float2 l9_585=l9_518;
int l9_586=l9_516;
int l9_587=l9_517;
float l9_588=l9_526;
float2 l9_589=l9_585;
int l9_590=l9_586;
int l9_591=l9_587;
float3 l9_592=float3(0.0);
if (l9_590==0)
{
l9_592=float3(l9_589,0.0);
}
else
{
if (l9_590==1)
{
l9_592=float3(l9_589.x,(l9_589.y*0.5)+(0.5-(float(l9_591)*0.5)),0.0);
}
else
{
l9_592=float3(l9_589,float(l9_591));
}
}
float3 l9_593=l9_592;
float3 l9_594=l9_593;
float2 l9_595=l9_594.xy;
float l9_596=l9_588;
float4 l9_597=sc_set0.transformScaleTex.sample(sc_set0.transformScaleTexSmpSC,l9_595,level(l9_596));
float4 l9_598=l9_597;
float4 l9_599=l9_598;
if (l9_524)
{
l9_599=mix(l9_525,l9_599,float4(l9_528));
}
float4 l9_600=l9_599;
l9_509=l9_600;
float l9_601=0.0;
float l9_602=(*sc_set0.UserUniforms).minSca;
l9_601=l9_602;
float l9_603=0.0;
l9_603=l9_601;
float l9_604=0.0;
l9_604=l9_603;
float l9_605=0.0;
float l9_606=(*sc_set0.UserUniforms).maxSca;
l9_605=l9_606;
float l9_607=0.0;
l9_607=l9_605;
float l9_608=0.0;
l9_608=l9_607;
float l9_609=0.0;
l9_609=(((l9_509.x-(*sc_set0.UserUniforms).Port_RangeMinA_N040)/((*sc_set0.UserUniforms).Port_RangeMaxA_N040-(*sc_set0.UserUniforms).Port_RangeMinA_N040))*(l9_608-l9_604))+l9_604;
float l9_610=0.0;
int l9_611=gl_InstanceIndex;
l9_610=floor(float(l9_611)+0.5);
float l9_612=0.0;
l9_612=l9_610;
float l9_613=0.0;
float l9_614=(*sc_set0.UserUniforms).Tweak_N112;
l9_613=l9_614;
float l9_615=0.0;
l9_615=l9_613;
float l9_616=0.0;
l9_616=l9_612*l9_615;
float l9_617=0.0;
l9_617=param_53.gTimeElapsed*(*sc_set0.UserUniforms).Port_Multiplier_N089;
float l9_618=0.0;
l9_618=l9_617;
float l9_619=0.0;
float l9_620=(*sc_set0.UserUniforms).Tweak_N110;
l9_619=l9_620;
float l9_621=0.0;
l9_621=l9_619;
float l9_622=0.0;
l9_622=l9_618*l9_621;
float l9_623=0.0;
l9_623=l9_616+l9_622;
float l9_624=0.0;
l9_624=sin(l9_623);
float l9_625=0.0;
float l9_626=(*sc_set0.UserUniforms).Tweak_N111;
l9_625=l9_626;
float l9_627=0.0;
l9_627=l9_625;
float l9_628=0.0;
l9_628=l9_624*l9_627;
float l9_629=0.0;
l9_629=l9_628;
float l9_630=0.0;
float l9_631;
if ((int(Tweak_N166_tmp)!=0))
{
l9_631=1.001;
}
else
{
l9_631=0.001;
}
l9_631-=0.001;
l9_630=l9_631;
float l9_632=0.0;
l9_632=mix((*sc_set0.UserUniforms).Port_Input0_N179,l9_629,l9_630);
float l9_633=0.0;
l9_633=l9_632;
float l9_634=0.0;
l9_634=l9_633;
float l9_635=0.0;
l9_635=l9_609*l9_634;
param_51=l9_635;
param_52=param_51;
}
Result_N61=param_52;
float3 Output_N20=float3(0.0);
Output_N20=Position_N5*float3(Result_N61);
float3 Export_N105=float3(0.0);
Export_N105=Output_N20;
float3 Value_N96=float3(0.0);
Value_N96=Export_N105;
float3 Value_N39=float3(0.0);
Value_N39=Value_N96;
float Value_N100=0.0;
Value_N100=Output_N16;
float2 Value_N19=float2(0.0);
Value_N19.x=Value_N100;
Value_N19.y=(*sc_set0.UserUniforms).Port_Value2_N019;
float4 Color_N25=float4(0.0);
int l9_636=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_637=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_637=0;
}
else
{
l9_637=gl_InstanceIndex%2;
}
int l9_638=l9_637;
l9_636=1-l9_638;
}
else
{
int l9_639=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_639=0;
}
else
{
l9_639=gl_InstanceIndex%2;
}
int l9_640=l9_639;
l9_636=l9_640;
}
int l9_641=l9_636;
int param_54=transformPosRotTexLayout_tmp;
int param_55=l9_641;
float2 param_56=Value_N19;
bool param_57=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_58=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_59=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_60=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_61=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_62=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_63=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_64=0.0;
bool l9_642=param_62&&(!param_60);
float l9_643=1.0;
float l9_644=param_56.x;
int l9_645=param_59.x;
if (l9_645==1)
{
l9_644=fract(l9_644);
}
else
{
if (l9_645==2)
{
float l9_646=fract(l9_644);
float l9_647=l9_644-l9_646;
float l9_648=step(0.25,fract(l9_647*0.5));
l9_644=mix(l9_646,1.0-l9_646,fast::clamp(l9_648,0.0,1.0));
}
}
param_56.x=l9_644;
float l9_649=param_56.y;
int l9_650=param_59.y;
if (l9_650==1)
{
l9_649=fract(l9_649);
}
else
{
if (l9_650==2)
{
float l9_651=fract(l9_649);
float l9_652=l9_649-l9_651;
float l9_653=step(0.25,fract(l9_652*0.5));
l9_649=mix(l9_651,1.0-l9_651,fast::clamp(l9_653,0.0,1.0));
}
}
param_56.y=l9_649;
if (param_60)
{
bool l9_654=param_62;
bool l9_655;
if (l9_654)
{
l9_655=param_59.x==3;
}
else
{
l9_655=l9_654;
}
float l9_656=param_56.x;
float l9_657=param_61.x;
float l9_658=param_61.z;
bool l9_659=l9_655;
float l9_660=l9_643;
float l9_661=fast::clamp(l9_656,l9_657,l9_658);
float l9_662=step(abs(l9_656-l9_661),9.9999997e-06);
l9_660*=(l9_662+((1.0-float(l9_659))*(1.0-l9_662)));
l9_656=l9_661;
param_56.x=l9_656;
l9_643=l9_660;
bool l9_663=param_62;
bool l9_664;
if (l9_663)
{
l9_664=param_59.y==3;
}
else
{
l9_664=l9_663;
}
float l9_665=param_56.y;
float l9_666=param_61.y;
float l9_667=param_61.w;
bool l9_668=l9_664;
float l9_669=l9_643;
float l9_670=fast::clamp(l9_665,l9_666,l9_667);
float l9_671=step(abs(l9_665-l9_670),9.9999997e-06);
l9_669*=(l9_671+((1.0-float(l9_668))*(1.0-l9_671)));
l9_665=l9_670;
param_56.y=l9_665;
l9_643=l9_669;
}
float2 l9_672=param_56;
bool l9_673=param_57;
float3x3 l9_674=param_58;
if (l9_673)
{
l9_672=float2((l9_674*float3(l9_672,1.0)).xy);
}
float2 l9_675=l9_672;
float2 l9_676=l9_675;
float2 l9_677=l9_676;
param_56=l9_677;
float l9_678=param_56.x;
int l9_679=param_59.x;
bool l9_680=l9_642;
float l9_681=l9_643;
if ((l9_679==0)||(l9_679==3))
{
float l9_682=l9_678;
float l9_683=0.0;
float l9_684=1.0;
bool l9_685=l9_680;
float l9_686=l9_681;
float l9_687=fast::clamp(l9_682,l9_683,l9_684);
float l9_688=step(abs(l9_682-l9_687),9.9999997e-06);
l9_686*=(l9_688+((1.0-float(l9_685))*(1.0-l9_688)));
l9_682=l9_687;
l9_678=l9_682;
l9_681=l9_686;
}
param_56.x=l9_678;
l9_643=l9_681;
float l9_689=param_56.y;
int l9_690=param_59.y;
bool l9_691=l9_642;
float l9_692=l9_643;
if ((l9_690==0)||(l9_690==3))
{
float l9_693=l9_689;
float l9_694=0.0;
float l9_695=1.0;
bool l9_696=l9_691;
float l9_697=l9_692;
float l9_698=fast::clamp(l9_693,l9_694,l9_695);
float l9_699=step(abs(l9_693-l9_698),9.9999997e-06);
l9_697*=(l9_699+((1.0-float(l9_696))*(1.0-l9_699)));
l9_693=l9_698;
l9_689=l9_693;
l9_692=l9_697;
}
param_56.y=l9_689;
l9_643=l9_692;
float2 l9_700=param_56;
int l9_701=param_54;
int l9_702=param_55;
float l9_703=param_64;
float2 l9_704=l9_700;
int l9_705=l9_701;
int l9_706=l9_702;
float3 l9_707=float3(0.0);
if (l9_705==0)
{
l9_707=float3(l9_704,0.0);
}
else
{
if (l9_705==1)
{
l9_707=float3(l9_704.x,(l9_704.y*0.5)+(0.5-(float(l9_706)*0.5)),0.0);
}
else
{
l9_707=float3(l9_704,float(l9_706));
}
}
float3 l9_708=l9_707;
float3 l9_709=l9_708;
float2 l9_710=l9_709.xy;
float l9_711=l9_703;
float4 l9_712=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_710,level(l9_711));
float4 l9_713=l9_712;
float4 l9_714=l9_713;
if (param_62)
{
l9_714=mix(param_63,l9_714,float4(l9_643));
}
float4 l9_715=l9_714;
Color_N25=l9_715;
float Output_N0=0.0;
float param_65=(*sc_set0.UserUniforms).minRot;
Output_N0=param_65;
float Value_N121=0.0;
Value_N121=Output_N0;
float Value_N101=0.0;
Value_N101=Value_N121;
float Output_N9=0.0;
float param_66=(*sc_set0.UserUniforms).maxRot;
Output_N9=param_66;
float Value_N122=0.0;
Value_N122=Output_N9;
float Value_N102=0.0;
Value_N102=Value_N122;
float Value1_N24=0.0;
float Value2_N24=0.0;
float4 param_67=Color_N25;
float param_69=Value_N101;
float param_70=Value_N102;
float param_72=Value_N101;
float param_73=Value_N102;
float2 l9_716=param_67.xy;
float l9_717=param_69;
float l9_718=param_70;
float l9_719=0.99998999;
float2 l9_720=l9_716;
#if (1)
{
l9_720=floor((l9_720*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_721=dot(l9_720,float2(1.0,0.0039215689));
float l9_722=l9_721;
float l9_723=0.0;
float l9_724=l9_719;
float l9_725=l9_717;
float l9_726=l9_718;
float l9_727=l9_725+(((l9_722-l9_723)*(l9_726-l9_725))/(l9_724-l9_723));
float l9_728=l9_727;
float param_68=l9_728;
float2 l9_729=param_67.zw;
float l9_730=param_72;
float l9_731=param_73;
float l9_732=0.99998999;
float2 l9_733=l9_729;
#if (1)
{
l9_733=floor((l9_733*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_734=dot(l9_733,float2(1.0,0.0039215689));
float l9_735=l9_734;
float l9_736=0.0;
float l9_737=l9_732;
float l9_738=l9_730;
float l9_739=l9_731;
float l9_740=l9_738+(((l9_735-l9_736)*(l9_739-l9_738))/(l9_737-l9_736));
float l9_741=l9_740;
float param_71=l9_741;
Value1_N24=param_68;
Value2_N24=param_71;
float2 Value_N26=float2(0.0);
Value_N26.x=Value_N100;
Value_N26.y=(*sc_set0.UserUniforms).Port_Value2_N026;
float4 Color_N29=float4(0.0);
int l9_742=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_743=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_743=0;
}
else
{
l9_743=gl_InstanceIndex%2;
}
int l9_744=l9_743;
l9_742=1-l9_744;
}
else
{
int l9_745=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_745=0;
}
else
{
l9_745=gl_InstanceIndex%2;
}
int l9_746=l9_745;
l9_742=l9_746;
}
int l9_747=l9_742;
int param_74=transformPosRotTexLayout_tmp;
int param_75=l9_747;
float2 param_76=Value_N26;
bool param_77=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_78=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_79=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_80=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_81=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_82=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_83=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_84=0.0;
bool l9_748=param_82&&(!param_80);
float l9_749=1.0;
float l9_750=param_76.x;
int l9_751=param_79.x;
if (l9_751==1)
{
l9_750=fract(l9_750);
}
else
{
if (l9_751==2)
{
float l9_752=fract(l9_750);
float l9_753=l9_750-l9_752;
float l9_754=step(0.25,fract(l9_753*0.5));
l9_750=mix(l9_752,1.0-l9_752,fast::clamp(l9_754,0.0,1.0));
}
}
param_76.x=l9_750;
float l9_755=param_76.y;
int l9_756=param_79.y;
if (l9_756==1)
{
l9_755=fract(l9_755);
}
else
{
if (l9_756==2)
{
float l9_757=fract(l9_755);
float l9_758=l9_755-l9_757;
float l9_759=step(0.25,fract(l9_758*0.5));
l9_755=mix(l9_757,1.0-l9_757,fast::clamp(l9_759,0.0,1.0));
}
}
param_76.y=l9_755;
if (param_80)
{
bool l9_760=param_82;
bool l9_761;
if (l9_760)
{
l9_761=param_79.x==3;
}
else
{
l9_761=l9_760;
}
float l9_762=param_76.x;
float l9_763=param_81.x;
float l9_764=param_81.z;
bool l9_765=l9_761;
float l9_766=l9_749;
float l9_767=fast::clamp(l9_762,l9_763,l9_764);
float l9_768=step(abs(l9_762-l9_767),9.9999997e-06);
l9_766*=(l9_768+((1.0-float(l9_765))*(1.0-l9_768)));
l9_762=l9_767;
param_76.x=l9_762;
l9_749=l9_766;
bool l9_769=param_82;
bool l9_770;
if (l9_769)
{
l9_770=param_79.y==3;
}
else
{
l9_770=l9_769;
}
float l9_771=param_76.y;
float l9_772=param_81.y;
float l9_773=param_81.w;
bool l9_774=l9_770;
float l9_775=l9_749;
float l9_776=fast::clamp(l9_771,l9_772,l9_773);
float l9_777=step(abs(l9_771-l9_776),9.9999997e-06);
l9_775*=(l9_777+((1.0-float(l9_774))*(1.0-l9_777)));
l9_771=l9_776;
param_76.y=l9_771;
l9_749=l9_775;
}
float2 l9_778=param_76;
bool l9_779=param_77;
float3x3 l9_780=param_78;
if (l9_779)
{
l9_778=float2((l9_780*float3(l9_778,1.0)).xy);
}
float2 l9_781=l9_778;
float2 l9_782=l9_781;
float2 l9_783=l9_782;
param_76=l9_783;
float l9_784=param_76.x;
int l9_785=param_79.x;
bool l9_786=l9_748;
float l9_787=l9_749;
if ((l9_785==0)||(l9_785==3))
{
float l9_788=l9_784;
float l9_789=0.0;
float l9_790=1.0;
bool l9_791=l9_786;
float l9_792=l9_787;
float l9_793=fast::clamp(l9_788,l9_789,l9_790);
float l9_794=step(abs(l9_788-l9_793),9.9999997e-06);
l9_792*=(l9_794+((1.0-float(l9_791))*(1.0-l9_794)));
l9_788=l9_793;
l9_784=l9_788;
l9_787=l9_792;
}
param_76.x=l9_784;
l9_749=l9_787;
float l9_795=param_76.y;
int l9_796=param_79.y;
bool l9_797=l9_748;
float l9_798=l9_749;
if ((l9_796==0)||(l9_796==3))
{
float l9_799=l9_795;
float l9_800=0.0;
float l9_801=1.0;
bool l9_802=l9_797;
float l9_803=l9_798;
float l9_804=fast::clamp(l9_799,l9_800,l9_801);
float l9_805=step(abs(l9_799-l9_804),9.9999997e-06);
l9_803*=(l9_805+((1.0-float(l9_802))*(1.0-l9_805)));
l9_799=l9_804;
l9_795=l9_799;
l9_798=l9_803;
}
param_76.y=l9_795;
l9_749=l9_798;
float2 l9_806=param_76;
int l9_807=param_74;
int l9_808=param_75;
float l9_809=param_84;
float2 l9_810=l9_806;
int l9_811=l9_807;
int l9_812=l9_808;
float3 l9_813=float3(0.0);
if (l9_811==0)
{
l9_813=float3(l9_810,0.0);
}
else
{
if (l9_811==1)
{
l9_813=float3(l9_810.x,(l9_810.y*0.5)+(0.5-(float(l9_812)*0.5)),0.0);
}
else
{
l9_813=float3(l9_810,float(l9_812));
}
}
float3 l9_814=l9_813;
float3 l9_815=l9_814;
float2 l9_816=l9_815.xy;
float l9_817=l9_809;
float4 l9_818=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_816,level(l9_817));
float4 l9_819=l9_818;
float4 l9_820=l9_819;
if (param_82)
{
l9_820=mix(param_83,l9_820,float4(l9_749));
}
float4 l9_821=l9_820;
Color_N29=l9_821;
float Value1_N27=0.0;
float Value2_N27=0.0;
float4 param_85=Color_N29;
float param_87=Value_N101;
float param_88=Value_N102;
float param_90=Value_N101;
float param_91=Value_N102;
float2 l9_822=param_85.xy;
float l9_823=param_87;
float l9_824=param_88;
float l9_825=0.99998999;
float2 l9_826=l9_822;
#if (1)
{
l9_826=floor((l9_826*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_827=dot(l9_826,float2(1.0,0.0039215689));
float l9_828=l9_827;
float l9_829=0.0;
float l9_830=l9_825;
float l9_831=l9_823;
float l9_832=l9_824;
float l9_833=l9_831+(((l9_828-l9_829)*(l9_832-l9_831))/(l9_830-l9_829));
float l9_834=l9_833;
float param_86=l9_834;
float2 l9_835=param_85.zw;
float l9_836=param_90;
float l9_837=param_91;
float l9_838=0.99998999;
float2 l9_839=l9_835;
#if (1)
{
l9_839=floor((l9_839*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_840=dot(l9_839,float2(1.0,0.0039215689));
float l9_841=l9_840;
float l9_842=0.0;
float l9_843=l9_838;
float l9_844=l9_836;
float l9_845=l9_837;
float l9_846=l9_844+(((l9_841-l9_842)*(l9_845-l9_844))/(l9_843-l9_842));
float l9_847=l9_846;
float param_89=l9_847;
Value1_N27=param_86;
Value2_N27=param_89;
float4 Value_N34=float4(0.0);
Value_N34.x=Value1_N24;
Value_N34.y=Value2_N24;
Value_N34.z=Value1_N27;
Value_N34.w=Value2_N27;
float4 Value_N41=float4(0.0);
Value_N41=Value_N34;
float Value1_N42=0.0;
float Value2_N42=0.0;
float Value3_N42=0.0;
float Value4_N42=0.0;
float4 param_92=Value_N41;
float param_93=param_92.x;
float param_94=param_92.y;
float param_95=param_92.z;
float param_96=param_92.w;
Value1_N42=param_93;
Value2_N42=param_94;
Value3_N42=param_95;
Value4_N42=param_96;
float3 Value_N43=float3(0.0);
Value_N43.x=Value1_N42;
Value_N43.y=Value2_N42;
Value_N43.z=Value3_N42;
float3 Result_N32=float3(0.0);
Result_N32=cross(Value_N39,Value_N43);
float3 Output_N35=float3(0.0);
Output_N35=Value_N39*float3(Value4_N42);
float3 Output_N31=float3(0.0);
Output_N31=Result_N32-Output_N35;
float3 Result_N36=float3(0.0);
Result_N36=cross(Output_N31,Value_N43);
float3 Output_N37=float3(0.0);
Output_N37=Result_N36*float3((*sc_set0.UserUniforms).Port_Input1_N037);
float3 Output_N33=float3(0.0);
Output_N33=Output_N37+Value_N39;
float3 Export_N38=float3(0.0);
Export_N38=Output_N33;
float3 Export_N97=float3(0.0);
Export_N97=Export_N38;
float3 Value_N90=float3(0.0);
Value_N90=Export_N97;
float3 Output_N6=float3(0.0);
Output_N6=Value_N3.xyz+Value_N90;
float InstanceID_N141=0.0;
int l9_848=gl_InstanceIndex;
InstanceID_N141=floor(float(l9_848)+0.5);
float Value_N146=0.0;
Value_N146=InstanceID_N141;
float Output_N144=0.0;
float param_97=(*sc_set0.UserUniforms).Tweak_N144;
Output_N144=param_97;
float Value_N147=0.0;
Value_N147=Output_N144;
float Output_N148=0.0;
Output_N148=Value_N146*Value_N147;
float Time_N89=0.0;
Time_N89=Globals.gTimeElapsed*(*sc_set0.UserUniforms).Port_Multiplier_N089;
float Value_N149=0.0;
Value_N149=Time_N89;
float Output_N142=0.0;
float param_98=(*sc_set0.UserUniforms).Tweak_N142;
Output_N142=param_98;
float Value_N150=0.0;
Value_N150=Output_N142;
float Output_N151=0.0;
Output_N151=Value_N149*Value_N150;
float Output_N152=0.0;
Output_N152=Output_N148+Output_N151;
float Output_N153=0.0;
Output_N153=sin(Output_N152);
float Output_N143=0.0;
float param_99=(*sc_set0.UserUniforms).Tweak_N143;
Output_N143=param_99;
float Value_N154=0.0;
Value_N154=Output_N143;
float Output_N155=0.0;
Output_N155=Output_N153*Value_N154;
float Export_N156=0.0;
Export_N156=Output_N155;
float3 Value_N162=float3(0.0);
Value_N162.x=(*sc_set0.UserUniforms).Port_Value1_N162;
Value_N162.y=Export_N156;
Value_N162.z=(*sc_set0.UserUniforms).Port_Value3_N162;
float Output_N163=0.0;
float param_100;
if ((int(Tweak_N163_tmp)!=0))
{
param_100=1.001;
}
else
{
param_100=0.001;
}
param_100-=0.001;
Output_N163=param_100;
float3 Output_N178=float3(0.0);
Output_N178=mix((*sc_set0.UserUniforms).Port_Input0_N178,Value_N162,float3(Output_N163));
float3 Value_N161=float3(0.0);
Value_N161=Output_N178;
float3 Value_N160=float3(0.0);
Value_N160=Value_N161;
float3 Output_N159=float3(0.0);
Output_N159=Output_N6+Value_N160;
float3 VectorOut_N7=float3(0.0);
VectorOut_N7=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(Output_N159,1.0)).xyz;
float3 Export_N59=float3(0.0);
Export_N59=VectorOut_N7;
float3 Export_N117=float3(0.0);
Export_N117=Export_N59;
WorldPosition=Export_N117;
float3 Normal_N73=float3(0.0);
Normal_N73=Globals.VertexNormal_WorldSpace;
float3 Value_N75=float3(0.0);
Value_N75=Normal_N73;
float InstanceID_N13_1=0.0;
int l9_849=gl_InstanceIndex;
InstanceID_N13_1=floor(float(l9_849)+0.5);
float Output_N18_1=0.0;
Output_N18_1=InstanceID_N13_1+(*sc_set0.UserUniforms).Port_Input1_N018;
float Output_N15_1=0.0;
float param_101=(*sc_set0.UserUniforms).maxInstanceCount;
Output_N15_1=param_101;
float Value_N125_1=0.0;
Value_N125_1=Output_N15_1;
float Output_N16_1=0.0;
Output_N16_1=Output_N18_1/(Value_N125_1+1.234e-06);
float Value_N100_1=0.0;
Value_N100_1=Output_N16_1;
float2 Value_N19_1=float2(0.0);
Value_N19_1.x=Value_N100_1;
Value_N19_1.y=(*sc_set0.UserUniforms).Port_Value2_N019;
float4 Color_N25_1=float4(0.0);
int l9_850=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_851=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_851=0;
}
else
{
l9_851=gl_InstanceIndex%2;
}
int l9_852=l9_851;
l9_850=1-l9_852;
}
else
{
int l9_853=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_853=0;
}
else
{
l9_853=gl_InstanceIndex%2;
}
int l9_854=l9_853;
l9_850=l9_854;
}
int l9_855=l9_850;
int param_102=transformPosRotTexLayout_tmp;
int param_103=l9_855;
float2 param_104=Value_N19_1;
bool param_105=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_106=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_107=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_108=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_109=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_110=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_111=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_112=0.0;
bool l9_856=param_110&&(!param_108);
float l9_857=1.0;
float l9_858=param_104.x;
int l9_859=param_107.x;
if (l9_859==1)
{
l9_858=fract(l9_858);
}
else
{
if (l9_859==2)
{
float l9_860=fract(l9_858);
float l9_861=l9_858-l9_860;
float l9_862=step(0.25,fract(l9_861*0.5));
l9_858=mix(l9_860,1.0-l9_860,fast::clamp(l9_862,0.0,1.0));
}
}
param_104.x=l9_858;
float l9_863=param_104.y;
int l9_864=param_107.y;
if (l9_864==1)
{
l9_863=fract(l9_863);
}
else
{
if (l9_864==2)
{
float l9_865=fract(l9_863);
float l9_866=l9_863-l9_865;
float l9_867=step(0.25,fract(l9_866*0.5));
l9_863=mix(l9_865,1.0-l9_865,fast::clamp(l9_867,0.0,1.0));
}
}
param_104.y=l9_863;
if (param_108)
{
bool l9_868=param_110;
bool l9_869;
if (l9_868)
{
l9_869=param_107.x==3;
}
else
{
l9_869=l9_868;
}
float l9_870=param_104.x;
float l9_871=param_109.x;
float l9_872=param_109.z;
bool l9_873=l9_869;
float l9_874=l9_857;
float l9_875=fast::clamp(l9_870,l9_871,l9_872);
float l9_876=step(abs(l9_870-l9_875),9.9999997e-06);
l9_874*=(l9_876+((1.0-float(l9_873))*(1.0-l9_876)));
l9_870=l9_875;
param_104.x=l9_870;
l9_857=l9_874;
bool l9_877=param_110;
bool l9_878;
if (l9_877)
{
l9_878=param_107.y==3;
}
else
{
l9_878=l9_877;
}
float l9_879=param_104.y;
float l9_880=param_109.y;
float l9_881=param_109.w;
bool l9_882=l9_878;
float l9_883=l9_857;
float l9_884=fast::clamp(l9_879,l9_880,l9_881);
float l9_885=step(abs(l9_879-l9_884),9.9999997e-06);
l9_883*=(l9_885+((1.0-float(l9_882))*(1.0-l9_885)));
l9_879=l9_884;
param_104.y=l9_879;
l9_857=l9_883;
}
float2 l9_886=param_104;
bool l9_887=param_105;
float3x3 l9_888=param_106;
if (l9_887)
{
l9_886=float2((l9_888*float3(l9_886,1.0)).xy);
}
float2 l9_889=l9_886;
float2 l9_890=l9_889;
float2 l9_891=l9_890;
param_104=l9_891;
float l9_892=param_104.x;
int l9_893=param_107.x;
bool l9_894=l9_856;
float l9_895=l9_857;
if ((l9_893==0)||(l9_893==3))
{
float l9_896=l9_892;
float l9_897=0.0;
float l9_898=1.0;
bool l9_899=l9_894;
float l9_900=l9_895;
float l9_901=fast::clamp(l9_896,l9_897,l9_898);
float l9_902=step(abs(l9_896-l9_901),9.9999997e-06);
l9_900*=(l9_902+((1.0-float(l9_899))*(1.0-l9_902)));
l9_896=l9_901;
l9_892=l9_896;
l9_895=l9_900;
}
param_104.x=l9_892;
l9_857=l9_895;
float l9_903=param_104.y;
int l9_904=param_107.y;
bool l9_905=l9_856;
float l9_906=l9_857;
if ((l9_904==0)||(l9_904==3))
{
float l9_907=l9_903;
float l9_908=0.0;
float l9_909=1.0;
bool l9_910=l9_905;
float l9_911=l9_906;
float l9_912=fast::clamp(l9_907,l9_908,l9_909);
float l9_913=step(abs(l9_907-l9_912),9.9999997e-06);
l9_911*=(l9_913+((1.0-float(l9_910))*(1.0-l9_913)));
l9_907=l9_912;
l9_903=l9_907;
l9_906=l9_911;
}
param_104.y=l9_903;
l9_857=l9_906;
float2 l9_914=param_104;
int l9_915=param_102;
int l9_916=param_103;
float l9_917=param_112;
float2 l9_918=l9_914;
int l9_919=l9_915;
int l9_920=l9_916;
float3 l9_921=float3(0.0);
if (l9_919==0)
{
l9_921=float3(l9_918,0.0);
}
else
{
if (l9_919==1)
{
l9_921=float3(l9_918.x,(l9_918.y*0.5)+(0.5-(float(l9_920)*0.5)),0.0);
}
else
{
l9_921=float3(l9_918,float(l9_920));
}
}
float3 l9_922=l9_921;
float3 l9_923=l9_922;
float2 l9_924=l9_923.xy;
float l9_925=l9_917;
float4 l9_926=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_924,level(l9_925));
float4 l9_927=l9_926;
float4 l9_928=l9_927;
if (param_110)
{
l9_928=mix(param_111,l9_928,float4(l9_857));
}
float4 l9_929=l9_928;
Color_N25_1=l9_929;
float Output_N0_1=0.0;
float param_113=(*sc_set0.UserUniforms).minRot;
Output_N0_1=param_113;
float Value_N121_1=0.0;
Value_N121_1=Output_N0_1;
float Value_N101_1=0.0;
Value_N101_1=Value_N121_1;
float Output_N9_1=0.0;
float param_114=(*sc_set0.UserUniforms).maxRot;
Output_N9_1=param_114;
float Value_N122_1=0.0;
Value_N122_1=Output_N9_1;
float Value_N102_1=0.0;
Value_N102_1=Value_N122_1;
float Value1_N24_1=0.0;
float Value2_N24_1=0.0;
float4 param_115=Color_N25_1;
float param_117=Value_N101_1;
float param_118=Value_N102_1;
float param_120=Value_N101_1;
float param_121=Value_N102_1;
float2 l9_930=param_115.xy;
float l9_931=param_117;
float l9_932=param_118;
float l9_933=0.99998999;
float2 l9_934=l9_930;
#if (1)
{
l9_934=floor((l9_934*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_935=dot(l9_934,float2(1.0,0.0039215689));
float l9_936=l9_935;
float l9_937=0.0;
float l9_938=l9_933;
float l9_939=l9_931;
float l9_940=l9_932;
float l9_941=l9_939+(((l9_936-l9_937)*(l9_940-l9_939))/(l9_938-l9_937));
float l9_942=l9_941;
float param_116=l9_942;
float2 l9_943=param_115.zw;
float l9_944=param_120;
float l9_945=param_121;
float l9_946=0.99998999;
float2 l9_947=l9_943;
#if (1)
{
l9_947=floor((l9_947*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_948=dot(l9_947,float2(1.0,0.0039215689));
float l9_949=l9_948;
float l9_950=0.0;
float l9_951=l9_946;
float l9_952=l9_944;
float l9_953=l9_945;
float l9_954=l9_952+(((l9_949-l9_950)*(l9_953-l9_952))/(l9_951-l9_950));
float l9_955=l9_954;
float param_119=l9_955;
Value1_N24_1=param_116;
Value2_N24_1=param_119;
float2 Value_N26_1=float2(0.0);
Value_N26_1.x=Value_N100_1;
Value_N26_1.y=(*sc_set0.UserUniforms).Port_Value2_N026;
float4 Color_N29_1=float4(0.0);
int l9_956=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_957=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_957=0;
}
else
{
l9_957=gl_InstanceIndex%2;
}
int l9_958=l9_957;
l9_956=1-l9_958;
}
else
{
int l9_959=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_959=0;
}
else
{
l9_959=gl_InstanceIndex%2;
}
int l9_960=l9_959;
l9_956=l9_960;
}
int l9_961=l9_956;
int param_122=transformPosRotTexLayout_tmp;
int param_123=l9_961;
float2 param_124=Value_N26_1;
bool param_125=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_126=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_127=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_128=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_129=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_130=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_131=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_132=0.0;
bool l9_962=param_130&&(!param_128);
float l9_963=1.0;
float l9_964=param_124.x;
int l9_965=param_127.x;
if (l9_965==1)
{
l9_964=fract(l9_964);
}
else
{
if (l9_965==2)
{
float l9_966=fract(l9_964);
float l9_967=l9_964-l9_966;
float l9_968=step(0.25,fract(l9_967*0.5));
l9_964=mix(l9_966,1.0-l9_966,fast::clamp(l9_968,0.0,1.0));
}
}
param_124.x=l9_964;
float l9_969=param_124.y;
int l9_970=param_127.y;
if (l9_970==1)
{
l9_969=fract(l9_969);
}
else
{
if (l9_970==2)
{
float l9_971=fract(l9_969);
float l9_972=l9_969-l9_971;
float l9_973=step(0.25,fract(l9_972*0.5));
l9_969=mix(l9_971,1.0-l9_971,fast::clamp(l9_973,0.0,1.0));
}
}
param_124.y=l9_969;
if (param_128)
{
bool l9_974=param_130;
bool l9_975;
if (l9_974)
{
l9_975=param_127.x==3;
}
else
{
l9_975=l9_974;
}
float l9_976=param_124.x;
float l9_977=param_129.x;
float l9_978=param_129.z;
bool l9_979=l9_975;
float l9_980=l9_963;
float l9_981=fast::clamp(l9_976,l9_977,l9_978);
float l9_982=step(abs(l9_976-l9_981),9.9999997e-06);
l9_980*=(l9_982+((1.0-float(l9_979))*(1.0-l9_982)));
l9_976=l9_981;
param_124.x=l9_976;
l9_963=l9_980;
bool l9_983=param_130;
bool l9_984;
if (l9_983)
{
l9_984=param_127.y==3;
}
else
{
l9_984=l9_983;
}
float l9_985=param_124.y;
float l9_986=param_129.y;
float l9_987=param_129.w;
bool l9_988=l9_984;
float l9_989=l9_963;
float l9_990=fast::clamp(l9_985,l9_986,l9_987);
float l9_991=step(abs(l9_985-l9_990),9.9999997e-06);
l9_989*=(l9_991+((1.0-float(l9_988))*(1.0-l9_991)));
l9_985=l9_990;
param_124.y=l9_985;
l9_963=l9_989;
}
float2 l9_992=param_124;
bool l9_993=param_125;
float3x3 l9_994=param_126;
if (l9_993)
{
l9_992=float2((l9_994*float3(l9_992,1.0)).xy);
}
float2 l9_995=l9_992;
float2 l9_996=l9_995;
float2 l9_997=l9_996;
param_124=l9_997;
float l9_998=param_124.x;
int l9_999=param_127.x;
bool l9_1000=l9_962;
float l9_1001=l9_963;
if ((l9_999==0)||(l9_999==3))
{
float l9_1002=l9_998;
float l9_1003=0.0;
float l9_1004=1.0;
bool l9_1005=l9_1000;
float l9_1006=l9_1001;
float l9_1007=fast::clamp(l9_1002,l9_1003,l9_1004);
float l9_1008=step(abs(l9_1002-l9_1007),9.9999997e-06);
l9_1006*=(l9_1008+((1.0-float(l9_1005))*(1.0-l9_1008)));
l9_1002=l9_1007;
l9_998=l9_1002;
l9_1001=l9_1006;
}
param_124.x=l9_998;
l9_963=l9_1001;
float l9_1009=param_124.y;
int l9_1010=param_127.y;
bool l9_1011=l9_962;
float l9_1012=l9_963;
if ((l9_1010==0)||(l9_1010==3))
{
float l9_1013=l9_1009;
float l9_1014=0.0;
float l9_1015=1.0;
bool l9_1016=l9_1011;
float l9_1017=l9_1012;
float l9_1018=fast::clamp(l9_1013,l9_1014,l9_1015);
float l9_1019=step(abs(l9_1013-l9_1018),9.9999997e-06);
l9_1017*=(l9_1019+((1.0-float(l9_1016))*(1.0-l9_1019)));
l9_1013=l9_1018;
l9_1009=l9_1013;
l9_1012=l9_1017;
}
param_124.y=l9_1009;
l9_963=l9_1012;
float2 l9_1020=param_124;
int l9_1021=param_122;
int l9_1022=param_123;
float l9_1023=param_132;
float2 l9_1024=l9_1020;
int l9_1025=l9_1021;
int l9_1026=l9_1022;
float3 l9_1027=float3(0.0);
if (l9_1025==0)
{
l9_1027=float3(l9_1024,0.0);
}
else
{
if (l9_1025==1)
{
l9_1027=float3(l9_1024.x,(l9_1024.y*0.5)+(0.5-(float(l9_1026)*0.5)),0.0);
}
else
{
l9_1027=float3(l9_1024,float(l9_1026));
}
}
float3 l9_1028=l9_1027;
float3 l9_1029=l9_1028;
float2 l9_1030=l9_1029.xy;
float l9_1031=l9_1023;
float4 l9_1032=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_1030,level(l9_1031));
float4 l9_1033=l9_1032;
float4 l9_1034=l9_1033;
if (param_130)
{
l9_1034=mix(param_131,l9_1034,float4(l9_963));
}
float4 l9_1035=l9_1034;
Color_N29_1=l9_1035;
float Value1_N27_1=0.0;
float Value2_N27_1=0.0;
float4 param_133=Color_N29_1;
float param_135=Value_N101_1;
float param_136=Value_N102_1;
float param_138=Value_N101_1;
float param_139=Value_N102_1;
float2 l9_1036=param_133.xy;
float l9_1037=param_135;
float l9_1038=param_136;
float l9_1039=0.99998999;
float2 l9_1040=l9_1036;
#if (1)
{
l9_1040=floor((l9_1040*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1041=dot(l9_1040,float2(1.0,0.0039215689));
float l9_1042=l9_1041;
float l9_1043=0.0;
float l9_1044=l9_1039;
float l9_1045=l9_1037;
float l9_1046=l9_1038;
float l9_1047=l9_1045+(((l9_1042-l9_1043)*(l9_1046-l9_1045))/(l9_1044-l9_1043));
float l9_1048=l9_1047;
float param_134=l9_1048;
float2 l9_1049=param_133.zw;
float l9_1050=param_138;
float l9_1051=param_139;
float l9_1052=0.99998999;
float2 l9_1053=l9_1049;
#if (1)
{
l9_1053=floor((l9_1053*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1054=dot(l9_1053,float2(1.0,0.0039215689));
float l9_1055=l9_1054;
float l9_1056=0.0;
float l9_1057=l9_1052;
float l9_1058=l9_1050;
float l9_1059=l9_1051;
float l9_1060=l9_1058+(((l9_1055-l9_1056)*(l9_1059-l9_1058))/(l9_1057-l9_1056));
float l9_1061=l9_1060;
float param_137=l9_1061;
Value1_N27_1=param_134;
Value2_N27_1=param_137;
float4 Value_N34_1=float4(0.0);
Value_N34_1.x=Value1_N24_1;
Value_N34_1.y=Value2_N24_1;
Value_N34_1.z=Value1_N27_1;
Value_N34_1.w=Value2_N27_1;
float4 Value_N76=float4(0.0);
Value_N76=Value_N34_1;
float Value1_N77=0.0;
float Value2_N77=0.0;
float Value3_N77=0.0;
float Value4_N77=0.0;
float4 param_140=Value_N76;
float param_141=param_140.x;
float param_142=param_140.y;
float param_143=param_140.z;
float param_144=param_140.w;
Value1_N77=param_141;
Value2_N77=param_142;
Value3_N77=param_143;
Value4_N77=param_144;
float3 Value_N78=float3(0.0);
Value_N78.x=Value1_N77;
Value_N78.y=Value2_N77;
Value_N78.z=Value3_N77;
float3 Result_N79=float3(0.0);
Result_N79=cross(Value_N75,Value_N78);
float3 Output_N80=float3(0.0);
Output_N80=Value_N75*float3(Value4_N77);
float3 Output_N81=float3(0.0);
Output_N81=Result_N79-Output_N80;
float3 Result_N82=float3(0.0);
Result_N82=cross(Output_N81,Value_N78);
float3 Output_N83=float3(0.0);
Output_N83=Result_N82*float3((*sc_set0.UserUniforms).Port_Input1_N083);
float3 Output_N84=float3(0.0);
Output_N84=Output_N83+Value_N75;
float3 Export_N85=float3(0.0);
Export_N85=Output_N84;
float3 Export_N99=float3(0.0);
Export_N99=Export_N85;
float3 Export_N124=float3(0.0);
Export_N124=Export_N99;
WorldNormal=Export_N124;
float3 Tangent_N72=float3(0.0);
Tangent_N72=Globals.VertexTangent_ObjectSpace;
float3 Value_N63=float3(0.0);
Value_N63=Tangent_N72;
float InstanceID_N13_2=0.0;
int l9_1062=gl_InstanceIndex;
InstanceID_N13_2=floor(float(l9_1062)+0.5);
float Output_N18_2=0.0;
Output_N18_2=InstanceID_N13_2+(*sc_set0.UserUniforms).Port_Input1_N018;
float Output_N15_2=0.0;
float param_145=(*sc_set0.UserUniforms).maxInstanceCount;
Output_N15_2=param_145;
float Value_N125_2=0.0;
Value_N125_2=Output_N15_2;
float Output_N16_2=0.0;
Output_N16_2=Output_N18_2/(Value_N125_2+1.234e-06);
float Value_N100_2=0.0;
Value_N100_2=Output_N16_2;
float2 Value_N19_2=float2(0.0);
Value_N19_2.x=Value_N100_2;
Value_N19_2.y=(*sc_set0.UserUniforms).Port_Value2_N019;
float4 Color_N25_2=float4(0.0);
int l9_1063=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_1064=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1064=0;
}
else
{
l9_1064=gl_InstanceIndex%2;
}
int l9_1065=l9_1064;
l9_1063=1-l9_1065;
}
else
{
int l9_1066=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1066=0;
}
else
{
l9_1066=gl_InstanceIndex%2;
}
int l9_1067=l9_1066;
l9_1063=l9_1067;
}
int l9_1068=l9_1063;
int param_146=transformPosRotTexLayout_tmp;
int param_147=l9_1068;
float2 param_148=Value_N19_2;
bool param_149=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_150=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_151=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_152=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_153=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_154=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_155=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_156=0.0;
bool l9_1069=param_154&&(!param_152);
float l9_1070=1.0;
float l9_1071=param_148.x;
int l9_1072=param_151.x;
if (l9_1072==1)
{
l9_1071=fract(l9_1071);
}
else
{
if (l9_1072==2)
{
float l9_1073=fract(l9_1071);
float l9_1074=l9_1071-l9_1073;
float l9_1075=step(0.25,fract(l9_1074*0.5));
l9_1071=mix(l9_1073,1.0-l9_1073,fast::clamp(l9_1075,0.0,1.0));
}
}
param_148.x=l9_1071;
float l9_1076=param_148.y;
int l9_1077=param_151.y;
if (l9_1077==1)
{
l9_1076=fract(l9_1076);
}
else
{
if (l9_1077==2)
{
float l9_1078=fract(l9_1076);
float l9_1079=l9_1076-l9_1078;
float l9_1080=step(0.25,fract(l9_1079*0.5));
l9_1076=mix(l9_1078,1.0-l9_1078,fast::clamp(l9_1080,0.0,1.0));
}
}
param_148.y=l9_1076;
if (param_152)
{
bool l9_1081=param_154;
bool l9_1082;
if (l9_1081)
{
l9_1082=param_151.x==3;
}
else
{
l9_1082=l9_1081;
}
float l9_1083=param_148.x;
float l9_1084=param_153.x;
float l9_1085=param_153.z;
bool l9_1086=l9_1082;
float l9_1087=l9_1070;
float l9_1088=fast::clamp(l9_1083,l9_1084,l9_1085);
float l9_1089=step(abs(l9_1083-l9_1088),9.9999997e-06);
l9_1087*=(l9_1089+((1.0-float(l9_1086))*(1.0-l9_1089)));
l9_1083=l9_1088;
param_148.x=l9_1083;
l9_1070=l9_1087;
bool l9_1090=param_154;
bool l9_1091;
if (l9_1090)
{
l9_1091=param_151.y==3;
}
else
{
l9_1091=l9_1090;
}
float l9_1092=param_148.y;
float l9_1093=param_153.y;
float l9_1094=param_153.w;
bool l9_1095=l9_1091;
float l9_1096=l9_1070;
float l9_1097=fast::clamp(l9_1092,l9_1093,l9_1094);
float l9_1098=step(abs(l9_1092-l9_1097),9.9999997e-06);
l9_1096*=(l9_1098+((1.0-float(l9_1095))*(1.0-l9_1098)));
l9_1092=l9_1097;
param_148.y=l9_1092;
l9_1070=l9_1096;
}
float2 l9_1099=param_148;
bool l9_1100=param_149;
float3x3 l9_1101=param_150;
if (l9_1100)
{
l9_1099=float2((l9_1101*float3(l9_1099,1.0)).xy);
}
float2 l9_1102=l9_1099;
float2 l9_1103=l9_1102;
float2 l9_1104=l9_1103;
param_148=l9_1104;
float l9_1105=param_148.x;
int l9_1106=param_151.x;
bool l9_1107=l9_1069;
float l9_1108=l9_1070;
if ((l9_1106==0)||(l9_1106==3))
{
float l9_1109=l9_1105;
float l9_1110=0.0;
float l9_1111=1.0;
bool l9_1112=l9_1107;
float l9_1113=l9_1108;
float l9_1114=fast::clamp(l9_1109,l9_1110,l9_1111);
float l9_1115=step(abs(l9_1109-l9_1114),9.9999997e-06);
l9_1113*=(l9_1115+((1.0-float(l9_1112))*(1.0-l9_1115)));
l9_1109=l9_1114;
l9_1105=l9_1109;
l9_1108=l9_1113;
}
param_148.x=l9_1105;
l9_1070=l9_1108;
float l9_1116=param_148.y;
int l9_1117=param_151.y;
bool l9_1118=l9_1069;
float l9_1119=l9_1070;
if ((l9_1117==0)||(l9_1117==3))
{
float l9_1120=l9_1116;
float l9_1121=0.0;
float l9_1122=1.0;
bool l9_1123=l9_1118;
float l9_1124=l9_1119;
float l9_1125=fast::clamp(l9_1120,l9_1121,l9_1122);
float l9_1126=step(abs(l9_1120-l9_1125),9.9999997e-06);
l9_1124*=(l9_1126+((1.0-float(l9_1123))*(1.0-l9_1126)));
l9_1120=l9_1125;
l9_1116=l9_1120;
l9_1119=l9_1124;
}
param_148.y=l9_1116;
l9_1070=l9_1119;
float2 l9_1127=param_148;
int l9_1128=param_146;
int l9_1129=param_147;
float l9_1130=param_156;
float2 l9_1131=l9_1127;
int l9_1132=l9_1128;
int l9_1133=l9_1129;
float3 l9_1134=float3(0.0);
if (l9_1132==0)
{
l9_1134=float3(l9_1131,0.0);
}
else
{
if (l9_1132==1)
{
l9_1134=float3(l9_1131.x,(l9_1131.y*0.5)+(0.5-(float(l9_1133)*0.5)),0.0);
}
else
{
l9_1134=float3(l9_1131,float(l9_1133));
}
}
float3 l9_1135=l9_1134;
float3 l9_1136=l9_1135;
float2 l9_1137=l9_1136.xy;
float l9_1138=l9_1130;
float4 l9_1139=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_1137,level(l9_1138));
float4 l9_1140=l9_1139;
float4 l9_1141=l9_1140;
if (param_154)
{
l9_1141=mix(param_155,l9_1141,float4(l9_1070));
}
float4 l9_1142=l9_1141;
Color_N25_2=l9_1142;
float Output_N0_2=0.0;
float param_157=(*sc_set0.UserUniforms).minRot;
Output_N0_2=param_157;
float Value_N121_2=0.0;
Value_N121_2=Output_N0_2;
float Value_N101_2=0.0;
Value_N101_2=Value_N121_2;
float Output_N9_2=0.0;
float param_158=(*sc_set0.UserUniforms).maxRot;
Output_N9_2=param_158;
float Value_N122_2=0.0;
Value_N122_2=Output_N9_2;
float Value_N102_2=0.0;
Value_N102_2=Value_N122_2;
float Value1_N24_2=0.0;
float Value2_N24_2=0.0;
float4 param_159=Color_N25_2;
float param_161=Value_N101_2;
float param_162=Value_N102_2;
float param_164=Value_N101_2;
float param_165=Value_N102_2;
float2 l9_1143=param_159.xy;
float l9_1144=param_161;
float l9_1145=param_162;
float l9_1146=0.99998999;
float2 l9_1147=l9_1143;
#if (1)
{
l9_1147=floor((l9_1147*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1148=dot(l9_1147,float2(1.0,0.0039215689));
float l9_1149=l9_1148;
float l9_1150=0.0;
float l9_1151=l9_1146;
float l9_1152=l9_1144;
float l9_1153=l9_1145;
float l9_1154=l9_1152+(((l9_1149-l9_1150)*(l9_1153-l9_1152))/(l9_1151-l9_1150));
float l9_1155=l9_1154;
float param_160=l9_1155;
float2 l9_1156=param_159.zw;
float l9_1157=param_164;
float l9_1158=param_165;
float l9_1159=0.99998999;
float2 l9_1160=l9_1156;
#if (1)
{
l9_1160=floor((l9_1160*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1161=dot(l9_1160,float2(1.0,0.0039215689));
float l9_1162=l9_1161;
float l9_1163=0.0;
float l9_1164=l9_1159;
float l9_1165=l9_1157;
float l9_1166=l9_1158;
float l9_1167=l9_1165+(((l9_1162-l9_1163)*(l9_1166-l9_1165))/(l9_1164-l9_1163));
float l9_1168=l9_1167;
float param_163=l9_1168;
Value1_N24_2=param_160;
Value2_N24_2=param_163;
float2 Value_N26_2=float2(0.0);
Value_N26_2.x=Value_N100_2;
Value_N26_2.y=(*sc_set0.UserUniforms).Port_Value2_N026;
float4 Color_N29_2=float4(0.0);
int l9_1169=0;
if ((int(transformPosRotTexHasSwappedViews_tmp)!=0))
{
int l9_1170=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1170=0;
}
else
{
l9_1170=gl_InstanceIndex%2;
}
int l9_1171=l9_1170;
l9_1169=1-l9_1171;
}
else
{
int l9_1172=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1172=0;
}
else
{
l9_1172=gl_InstanceIndex%2;
}
int l9_1173=l9_1172;
l9_1169=l9_1173;
}
int l9_1174=l9_1169;
int param_166=transformPosRotTexLayout_tmp;
int param_167=l9_1174;
float2 param_168=Value_N26_2;
bool param_169=(int(SC_USE_UV_TRANSFORM_transformPosRotTex_tmp)!=0);
float3x3 param_170=(*sc_set0.UserUniforms).transformPosRotTexTransform;
int2 param_171=int2(SC_SOFTWARE_WRAP_MODE_U_transformPosRotTex_tmp,SC_SOFTWARE_WRAP_MODE_V_transformPosRotTex_tmp);
bool param_172=(int(SC_USE_UV_MIN_MAX_transformPosRotTex_tmp)!=0);
float4 param_173=(*sc_set0.UserUniforms).transformPosRotTexUvMinMax;
bool param_174=(int(SC_USE_CLAMP_TO_BORDER_transformPosRotTex_tmp)!=0);
float4 param_175=(*sc_set0.UserUniforms).transformPosRotTexBorderColor;
float param_176=0.0;
bool l9_1175=param_174&&(!param_172);
float l9_1176=1.0;
float l9_1177=param_168.x;
int l9_1178=param_171.x;
if (l9_1178==1)
{
l9_1177=fract(l9_1177);
}
else
{
if (l9_1178==2)
{
float l9_1179=fract(l9_1177);
float l9_1180=l9_1177-l9_1179;
float l9_1181=step(0.25,fract(l9_1180*0.5));
l9_1177=mix(l9_1179,1.0-l9_1179,fast::clamp(l9_1181,0.0,1.0));
}
}
param_168.x=l9_1177;
float l9_1182=param_168.y;
int l9_1183=param_171.y;
if (l9_1183==1)
{
l9_1182=fract(l9_1182);
}
else
{
if (l9_1183==2)
{
float l9_1184=fract(l9_1182);
float l9_1185=l9_1182-l9_1184;
float l9_1186=step(0.25,fract(l9_1185*0.5));
l9_1182=mix(l9_1184,1.0-l9_1184,fast::clamp(l9_1186,0.0,1.0));
}
}
param_168.y=l9_1182;
if (param_172)
{
bool l9_1187=param_174;
bool l9_1188;
if (l9_1187)
{
l9_1188=param_171.x==3;
}
else
{
l9_1188=l9_1187;
}
float l9_1189=param_168.x;
float l9_1190=param_173.x;
float l9_1191=param_173.z;
bool l9_1192=l9_1188;
float l9_1193=l9_1176;
float l9_1194=fast::clamp(l9_1189,l9_1190,l9_1191);
float l9_1195=step(abs(l9_1189-l9_1194),9.9999997e-06);
l9_1193*=(l9_1195+((1.0-float(l9_1192))*(1.0-l9_1195)));
l9_1189=l9_1194;
param_168.x=l9_1189;
l9_1176=l9_1193;
bool l9_1196=param_174;
bool l9_1197;
if (l9_1196)
{
l9_1197=param_171.y==3;
}
else
{
l9_1197=l9_1196;
}
float l9_1198=param_168.y;
float l9_1199=param_173.y;
float l9_1200=param_173.w;
bool l9_1201=l9_1197;
float l9_1202=l9_1176;
float l9_1203=fast::clamp(l9_1198,l9_1199,l9_1200);
float l9_1204=step(abs(l9_1198-l9_1203),9.9999997e-06);
l9_1202*=(l9_1204+((1.0-float(l9_1201))*(1.0-l9_1204)));
l9_1198=l9_1203;
param_168.y=l9_1198;
l9_1176=l9_1202;
}
float2 l9_1205=param_168;
bool l9_1206=param_169;
float3x3 l9_1207=param_170;
if (l9_1206)
{
l9_1205=float2((l9_1207*float3(l9_1205,1.0)).xy);
}
float2 l9_1208=l9_1205;
float2 l9_1209=l9_1208;
float2 l9_1210=l9_1209;
param_168=l9_1210;
float l9_1211=param_168.x;
int l9_1212=param_171.x;
bool l9_1213=l9_1175;
float l9_1214=l9_1176;
if ((l9_1212==0)||(l9_1212==3))
{
float l9_1215=l9_1211;
float l9_1216=0.0;
float l9_1217=1.0;
bool l9_1218=l9_1213;
float l9_1219=l9_1214;
float l9_1220=fast::clamp(l9_1215,l9_1216,l9_1217);
float l9_1221=step(abs(l9_1215-l9_1220),9.9999997e-06);
l9_1219*=(l9_1221+((1.0-float(l9_1218))*(1.0-l9_1221)));
l9_1215=l9_1220;
l9_1211=l9_1215;
l9_1214=l9_1219;
}
param_168.x=l9_1211;
l9_1176=l9_1214;
float l9_1222=param_168.y;
int l9_1223=param_171.y;
bool l9_1224=l9_1175;
float l9_1225=l9_1176;
if ((l9_1223==0)||(l9_1223==3))
{
float l9_1226=l9_1222;
float l9_1227=0.0;
float l9_1228=1.0;
bool l9_1229=l9_1224;
float l9_1230=l9_1225;
float l9_1231=fast::clamp(l9_1226,l9_1227,l9_1228);
float l9_1232=step(abs(l9_1226-l9_1231),9.9999997e-06);
l9_1230*=(l9_1232+((1.0-float(l9_1229))*(1.0-l9_1232)));
l9_1226=l9_1231;
l9_1222=l9_1226;
l9_1225=l9_1230;
}
param_168.y=l9_1222;
l9_1176=l9_1225;
float2 l9_1233=param_168;
int l9_1234=param_166;
int l9_1235=param_167;
float l9_1236=param_176;
float2 l9_1237=l9_1233;
int l9_1238=l9_1234;
int l9_1239=l9_1235;
float3 l9_1240=float3(0.0);
if (l9_1238==0)
{
l9_1240=float3(l9_1237,0.0);
}
else
{
if (l9_1238==1)
{
l9_1240=float3(l9_1237.x,(l9_1237.y*0.5)+(0.5-(float(l9_1239)*0.5)),0.0);
}
else
{
l9_1240=float3(l9_1237,float(l9_1239));
}
}
float3 l9_1241=l9_1240;
float3 l9_1242=l9_1241;
float2 l9_1243=l9_1242.xy;
float l9_1244=l9_1236;
float4 l9_1245=sc_set0.transformPosRotTex.sample(sc_set0.transformPosRotTexSmpSC,l9_1243,level(l9_1244));
float4 l9_1246=l9_1245;
float4 l9_1247=l9_1246;
if (param_174)
{
l9_1247=mix(param_175,l9_1247,float4(l9_1176));
}
float4 l9_1248=l9_1247;
Color_N29_2=l9_1248;
float Value1_N27_2=0.0;
float Value2_N27_2=0.0;
float4 param_177=Color_N29_2;
float param_179=Value_N101_2;
float param_180=Value_N102_2;
float param_182=Value_N101_2;
float param_183=Value_N102_2;
float2 l9_1249=param_177.xy;
float l9_1250=param_179;
float l9_1251=param_180;
float l9_1252=0.99998999;
float2 l9_1253=l9_1249;
#if (1)
{
l9_1253=floor((l9_1253*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1254=dot(l9_1253,float2(1.0,0.0039215689));
float l9_1255=l9_1254;
float l9_1256=0.0;
float l9_1257=l9_1252;
float l9_1258=l9_1250;
float l9_1259=l9_1251;
float l9_1260=l9_1258+(((l9_1255-l9_1256)*(l9_1259-l9_1258))/(l9_1257-l9_1256));
float l9_1261=l9_1260;
float param_178=l9_1261;
float2 l9_1262=param_177.zw;
float l9_1263=param_182;
float l9_1264=param_183;
float l9_1265=0.99998999;
float2 l9_1266=l9_1262;
#if (1)
{
l9_1266=floor((l9_1266*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1267=dot(l9_1266,float2(1.0,0.0039215689));
float l9_1268=l9_1267;
float l9_1269=0.0;
float l9_1270=l9_1265;
float l9_1271=l9_1263;
float l9_1272=l9_1264;
float l9_1273=l9_1271+(((l9_1268-l9_1269)*(l9_1272-l9_1271))/(l9_1270-l9_1269));
float l9_1274=l9_1273;
float param_181=l9_1274;
Value1_N27_2=param_178;
Value2_N27_2=param_181;
float4 Value_N34_2=float4(0.0);
Value_N34_2.x=Value1_N24_2;
Value_N34_2.y=Value2_N24_2;
Value_N34_2.z=Value1_N27_2;
Value_N34_2.w=Value2_N27_2;
float4 Value_N64=float4(0.0);
Value_N64=Value_N34_2;
float Value1_N65=0.0;
float Value2_N65=0.0;
float Value3_N65=0.0;
float Value4_N65=0.0;
float4 param_184=Value_N64;
float param_185=param_184.x;
float param_186=param_184.y;
float param_187=param_184.z;
float param_188=param_184.w;
Value1_N65=param_185;
Value2_N65=param_186;
Value3_N65=param_187;
Value4_N65=param_188;
float3 Value_N66=float3(0.0);
Value_N66.x=Value1_N65;
Value_N66.y=Value2_N65;
Value_N66.z=Value3_N65;
float3 Result_N67=float3(0.0);
Result_N67=cross(Value_N63,Value_N66);
float3 Output_N68=float3(0.0);
Output_N68=Value_N63*float3(Value4_N65);
float3 Output_N69=float3(0.0);
Output_N69=Result_N67-Output_N68;
float3 Result_N70=float3(0.0);
Result_N70=cross(Output_N69,Value_N66);
float3 Output_N71=float3(0.0);
Output_N71=Result_N70*float3((*sc_set0.UserUniforms).Port_Input1_N071);
float3 Output_N86=float3(0.0);
Output_N86=Output_N71+Value_N63;
float3 Export_N87=float3(0.0);
Export_N87=Output_N86;
float3 Export_N98=float3(0.0);
Export_N98=Export_N87;
float3 Export_N123=float3(0.0);
Export_N123=Export_N98;
WorldTangent=Export_N123;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_189=v;
float3 param_190=WorldPosition;
float3 param_191=WorldNormal;
float3 param_192=WorldTangent;
float4 param_193=v.position;
out.varPos=param_190;
out.varNormal=normalize(param_191);
float3 l9_1275=normalize(param_192);
out.varTangent=float4(l9_1275.x,l9_1275.y,l9_1275.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_1276=param_189.position;
float4 l9_1277=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_1278=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1278=0;
}
else
{
l9_1278=gl_InstanceIndex%2;
}
int l9_1279=l9_1278;
l9_1277=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_1279]*l9_1276;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_1280=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1280=0;
}
else
{
l9_1280=gl_InstanceIndex%2;
}
int l9_1281=l9_1280;
l9_1277=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_1281]*l9_1276;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_1282=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1282=0;
}
else
{
l9_1282=gl_InstanceIndex%2;
}
int l9_1283=l9_1282;
l9_1277=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_1283]*l9_1276;
}
else
{
l9_1277=l9_1276;
}
}
}
float4 l9_1284=l9_1277;
out.varViewSpaceDepth=-l9_1284.z;
}
float4 l9_1285=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_1285=param_193;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_1286=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1286=0;
}
else
{
l9_1286=gl_InstanceIndex%2;
}
int l9_1287=l9_1286;
l9_1285=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_1287]*param_189.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_1288=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1288=0;
}
else
{
l9_1288=gl_InstanceIndex%2;
}
int l9_1289=l9_1288;
l9_1285=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_1289]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_1290=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1290=0;
}
else
{
l9_1290=gl_InstanceIndex%2;
}
int l9_1291=l9_1290;
l9_1285=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_1291]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_189.texture0,param_189.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_1292=param_189.position;
float4 l9_1293=l9_1292;
if (sc_RenderingSpace_tmp==1)
{
l9_1293=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_1292;
}
float4 l9_1294=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_1293;
float2 l9_1295=((l9_1294.xy/float2(l9_1294.w))*0.5)+float2(0.5);
out.varShadowTex=l9_1295;
}
float4 l9_1296=l9_1285;
if (sc_DepthBufferMode_tmp==1)
{
int l9_1297=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1297=0;
}
else
{
l9_1297=gl_InstanceIndex%2;
}
int l9_1298=l9_1297;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_1298][2].w!=0.0)
{
float l9_1299=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_1296.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_1296.w))*l9_1299)-1.0)*l9_1296.w;
}
}
float4 l9_1300=l9_1296;
l9_1285=l9_1300;
float4 l9_1301=l9_1285;
float4 l9_1302=l9_1301;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1302.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1303=l9_1302;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1304=dot(l9_1303,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1305=l9_1304;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1305;
}
}
float4 l9_1306=float4(l9_1302.x,-l9_1302.y,(l9_1302.z*0.5)+(l9_1302.w*0.5),l9_1302.w);
out.gl_Position=l9_1306;
v=param_189;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 transformPosRotTexSize;
float4 transformPosRotTexDims;
float4 transformPosRotTexView;
float3x3 transformPosRotTexTransform;
float4 transformPosRotTexUvMinMax;
float4 transformPosRotTexBorderColor;
float maxInstanceCount;
float minPos;
float maxPos;
float4 transformScaleTexSize;
float4 transformScaleTexDims;
float4 transformScaleTexView;
float3x3 transformScaleTexTransform;
float4 transformScaleTexUvMinMax;
float4 transformScaleTexBorderColor;
float minSca;
float maxSca;
float Tweak_N112;
float Tweak_N110;
float Tweak_N111;
float minRot;
float maxRot;
float Tweak_N144;
float Tweak_N142;
float Tweak_N143;
float4 Tweak_N167Size;
float4 Tweak_N167Dims;
float4 Tweak_N167View;
float3x3 Tweak_N167Transform;
float4 Tweak_N167UvMinMax;
float4 Tweak_N167BorderColor;
float4 Tweak_N175;
float Tweak_N17;
float4 Tweak_N168Size;
float4 Tweak_N168Dims;
float4 Tweak_N168View;
float3x3 Tweak_N168Transform;
float4 Tweak_N168UvMinMax;
float4 Tweak_N168BorderColor;
float4 Tweak_N169Size;
float4 Tweak_N169Dims;
float4 Tweak_N169View;
float3x3 Tweak_N169Transform;
float4 Tweak_N169UvMinMax;
float4 Tweak_N169BorderColor;
float Port_Input1_N018;
float Port_Import_N125;
float Port_Import_N094;
float Port_Value2_N051;
float Port_Import_N115;
float Port_Import_N091;
float Port_Import_N116;
float Port_Import_N092;
float Port_Value2_N052;
float Port_Value2_N014;
float Port_Value4_N003;
float Port_Import_N109;
float Port_Value2_N028;
float Port_RangeMinA_N040;
float Port_RangeMaxA_N040;
float Port_Import_N119;
float Port_Import_N106;
float Port_Import_N120;
float Port_Import_N107;
float Port_Input1_N011;
float Port_Value1_N061;
float Port_Input0_N179;
float Port_Import_N127;
float Port_Import_N128;
float Port_Multiplier_N089;
float Port_Import_N130;
float Port_Import_N131;
float Port_Import_N135;
float Port_Import_N158;
float Port_Import_N140;
float3 Port_Import_N096;
float3 Port_Import_N039;
float Port_Import_N100;
float Port_Value2_N019;
float Port_Import_N121;
float Port_Import_N101;
float Port_Import_N122;
float Port_Import_N102;
float Port_Value2_N026;
float4 Port_Import_N041;
float Port_Input1_N037;
float3 Port_Import_N090;
float3 Port_Input0_N178;
float Port_Value1_N162;
float Port_Import_N146;
float Port_Import_N147;
float Port_Import_N149;
float Port_Import_N150;
float Port_Import_N154;
float Port_Value3_N162;
float3 Port_Import_N161;
float3 Port_Import_N160;
float3 Port_Import_N075;
float4 Port_Import_N076;
float Port_Input1_N083;
float3 Port_Import_N063;
float4 Port_Import_N064;
float Port_Input1_N071;
float4 Port_Default_N176;
float3 Port_Emissive_N174;
float3 Port_SpecularAO_N174;
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> Tweak_N167 [[id(1)]];
texture2d<float> Tweak_N168 [[id(2)]];
texture2d<float> Tweak_N169 [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracedAoTexture [[id(15)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(16)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(17)]];
texture2d<float> sc_RayTracedShadowTexture [[id(18)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
texture2d<float> sc_ShadowTexture [[id(21)]];
texture2d<float> transformPosRotTex [[id(23)]];
texture2d<float> transformScaleTex [[id(24)]];
sampler Tweak_N167SmpSC [[id(25)]];
sampler Tweak_N168SmpSC [[id(26)]];
sampler Tweak_N169SmpSC [[id(27)]];
sampler intensityTextureSmpSC [[id(28)]];
sampler sc_EnvmapDiffuseSmpSC [[id(29)]];
sampler sc_EnvmapSpecularSmpSC [[id(30)]];
sampler sc_RayTracedAoTextureSmpSC [[id(32)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(33)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(34)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(35)]];
sampler sc_SSAOTextureSmpSC [[id(36)]];
sampler sc_ScreenTextureSmpSC [[id(37)]];
sampler sc_ShadowTextureSmpSC [[id(38)]];
sampler transformPosRotTexSmpSC [[id(40)]];
sampler transformScaleTexSmpSC [[id(41)]];
constant userUniformsObj* UserUniforms [[id(42)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float4 sampleRayTracedReflections(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedReflections!=0;
if (!l9_0)
{
return float4(0.0);
}
else
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedReflectionTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedReflectionTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedReflectionTexture.sample(sc_RayTracedReflectionTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.039999999);
float a004=(fast::min(r.x*r.x,exp2((-9.2799997)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
}
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
float4 Result_N176=float4(0.0);
float4 param=float4(0.0);
float4 param_1=(*sc_set0.UserUniforms).Port_Default_N176;
ssGlobals param_3=Globals;
float4 param_2;
if ((int(Tweak_N177_tmp)!=0))
{
float4 l9_2=float4(0.0);
int l9_3=0;
if ((int(Tweak_N167HasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=in.varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=in.varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
int l9_9=Tweak_N167Layout_tmp;
int l9_10=l9_8;
float2 l9_11=param_3.Surface_UVCoord0;
bool l9_12=(int(SC_USE_UV_TRANSFORM_Tweak_N167_tmp)!=0);
float3x3 l9_13=(*sc_set0.UserUniforms).Tweak_N167Transform;
int2 l9_14=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N167_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N167_tmp);
bool l9_15=(int(SC_USE_UV_MIN_MAX_Tweak_N167_tmp)!=0);
float4 l9_16=(*sc_set0.UserUniforms).Tweak_N167UvMinMax;
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N167_tmp)!=0);
float4 l9_18=(*sc_set0.UserUniforms).Tweak_N167BorderColor;
float l9_19=0.0;
bool l9_20=l9_17&&(!l9_15);
float l9_21=1.0;
float l9_22=l9_11.x;
int l9_23=l9_14.x;
if (l9_23==1)
{
l9_22=fract(l9_22);
}
else
{
if (l9_23==2)
{
float l9_24=fract(l9_22);
float l9_25=l9_22-l9_24;
float l9_26=step(0.25,fract(l9_25*0.5));
l9_22=mix(l9_24,1.0-l9_24,fast::clamp(l9_26,0.0,1.0));
}
}
l9_11.x=l9_22;
float l9_27=l9_11.y;
int l9_28=l9_14.y;
if (l9_28==1)
{
l9_27=fract(l9_27);
}
else
{
if (l9_28==2)
{
float l9_29=fract(l9_27);
float l9_30=l9_27-l9_29;
float l9_31=step(0.25,fract(l9_30*0.5));
l9_27=mix(l9_29,1.0-l9_29,fast::clamp(l9_31,0.0,1.0));
}
}
l9_11.y=l9_27;
if (l9_15)
{
bool l9_32=l9_17;
bool l9_33;
if (l9_32)
{
l9_33=l9_14.x==3;
}
else
{
l9_33=l9_32;
}
float l9_34=l9_11.x;
float l9_35=l9_16.x;
float l9_36=l9_16.z;
bool l9_37=l9_33;
float l9_38=l9_21;
float l9_39=fast::clamp(l9_34,l9_35,l9_36);
float l9_40=step(abs(l9_34-l9_39),9.9999997e-06);
l9_38*=(l9_40+((1.0-float(l9_37))*(1.0-l9_40)));
l9_34=l9_39;
l9_11.x=l9_34;
l9_21=l9_38;
bool l9_41=l9_17;
bool l9_42;
if (l9_41)
{
l9_42=l9_14.y==3;
}
else
{
l9_42=l9_41;
}
float l9_43=l9_11.y;
float l9_44=l9_16.y;
float l9_45=l9_16.w;
bool l9_46=l9_42;
float l9_47=l9_21;
float l9_48=fast::clamp(l9_43,l9_44,l9_45);
float l9_49=step(abs(l9_43-l9_48),9.9999997e-06);
l9_47*=(l9_49+((1.0-float(l9_46))*(1.0-l9_49)));
l9_43=l9_48;
l9_11.y=l9_43;
l9_21=l9_47;
}
float2 l9_50=l9_11;
bool l9_51=l9_12;
float3x3 l9_52=l9_13;
if (l9_51)
{
l9_50=float2((l9_52*float3(l9_50,1.0)).xy);
}
float2 l9_53=l9_50;
float2 l9_54=l9_53;
float2 l9_55=l9_54;
l9_11=l9_55;
float l9_56=l9_11.x;
int l9_57=l9_14.x;
bool l9_58=l9_20;
float l9_59=l9_21;
if ((l9_57==0)||(l9_57==3))
{
float l9_60=l9_56;
float l9_61=0.0;
float l9_62=1.0;
bool l9_63=l9_58;
float l9_64=l9_59;
float l9_65=fast::clamp(l9_60,l9_61,l9_62);
float l9_66=step(abs(l9_60-l9_65),9.9999997e-06);
l9_64*=(l9_66+((1.0-float(l9_63))*(1.0-l9_66)));
l9_60=l9_65;
l9_56=l9_60;
l9_59=l9_64;
}
l9_11.x=l9_56;
l9_21=l9_59;
float l9_67=l9_11.y;
int l9_68=l9_14.y;
bool l9_69=l9_20;
float l9_70=l9_21;
if ((l9_68==0)||(l9_68==3))
{
float l9_71=l9_67;
float l9_72=0.0;
float l9_73=1.0;
bool l9_74=l9_69;
float l9_75=l9_70;
float l9_76=fast::clamp(l9_71,l9_72,l9_73);
float l9_77=step(abs(l9_71-l9_76),9.9999997e-06);
l9_75*=(l9_77+((1.0-float(l9_74))*(1.0-l9_77)));
l9_71=l9_76;
l9_67=l9_71;
l9_70=l9_75;
}
l9_11.y=l9_67;
l9_21=l9_70;
float2 l9_78=l9_11;
int l9_79=l9_9;
int l9_80=l9_10;
float l9_81=l9_19;
float2 l9_82=l9_78;
int l9_83=l9_79;
int l9_84=l9_80;
float3 l9_85=float3(0.0);
if (l9_83==0)
{
l9_85=float3(l9_82,0.0);
}
else
{
if (l9_83==1)
{
l9_85=float3(l9_82.x,(l9_82.y*0.5)+(0.5-(float(l9_84)*0.5)),0.0);
}
else
{
l9_85=float3(l9_82,float(l9_84));
}
}
float3 l9_86=l9_85;
float3 l9_87=l9_86;
float2 l9_88=l9_87.xy;
float l9_89=l9_81;
float4 l9_90=sc_set0.Tweak_N167.sample(sc_set0.Tweak_N167SmpSC,l9_88,bias(l9_89));
float4 l9_91=l9_90;
float4 l9_92=l9_91;
if (l9_17)
{
l9_92=mix(l9_18,l9_92,float4(l9_21));
}
float4 l9_93=l9_92;
l9_2=l9_93;
param=l9_2;
param_2=param;
}
else
{
param_2=param_1;
}
Result_N176=param_2;
float4 Output_N175=float4(0.0);
float4 param_4=(*sc_set0.UserUniforms).Tweak_N175;
Output_N175=param_4;
float4 Output_N173=float4(0.0);
Output_N173=Result_N176*Output_N175;
float3 Output_N49=float3(0.0);
Output_N49=float3(Output_N173.x,Output_N173.y,Output_N173.z);
float Output_N17=0.0;
float param_5=(*sc_set0.UserUniforms).Tweak_N17;
Output_N17=param_5;
float4 Value_N47=float4(0.0);
Value_N47=float4(Output_N49.x,Output_N49.y,Output_N49.z,Value_N47.w);
Value_N47.w=Output_N17;
float4 Output_N168=float4(0.0);
int l9_94=0;
if ((int(Tweak_N168HasSwappedViews_tmp)!=0))
{
int l9_95=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_95=0;
}
else
{
l9_95=in.varStereoViewID;
}
int l9_96=l9_95;
l9_94=1-l9_96;
}
else
{
int l9_97=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_97=0;
}
else
{
l9_97=in.varStereoViewID;
}
int l9_98=l9_97;
l9_94=l9_98;
}
int l9_99=l9_94;
int param_6=Tweak_N168Layout_tmp;
int param_7=l9_99;
float2 param_8=Globals.Surface_UVCoord0;
bool param_9=(int(SC_USE_UV_TRANSFORM_Tweak_N168_tmp)!=0);
float3x3 param_10=(*sc_set0.UserUniforms).Tweak_N168Transform;
int2 param_11=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N168_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N168_tmp);
bool param_12=(int(SC_USE_UV_MIN_MAX_Tweak_N168_tmp)!=0);
float4 param_13=(*sc_set0.UserUniforms).Tweak_N168UvMinMax;
bool param_14=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N168_tmp)!=0);
float4 param_15=(*sc_set0.UserUniforms).Tweak_N168BorderColor;
float param_16=0.0;
bool l9_100=param_14&&(!param_12);
float l9_101=1.0;
float l9_102=param_8.x;
int l9_103=param_11.x;
if (l9_103==1)
{
l9_102=fract(l9_102);
}
else
{
if (l9_103==2)
{
float l9_104=fract(l9_102);
float l9_105=l9_102-l9_104;
float l9_106=step(0.25,fract(l9_105*0.5));
l9_102=mix(l9_104,1.0-l9_104,fast::clamp(l9_106,0.0,1.0));
}
}
param_8.x=l9_102;
float l9_107=param_8.y;
int l9_108=param_11.y;
if (l9_108==1)
{
l9_107=fract(l9_107);
}
else
{
if (l9_108==2)
{
float l9_109=fract(l9_107);
float l9_110=l9_107-l9_109;
float l9_111=step(0.25,fract(l9_110*0.5));
l9_107=mix(l9_109,1.0-l9_109,fast::clamp(l9_111,0.0,1.0));
}
}
param_8.y=l9_107;
if (param_12)
{
bool l9_112=param_14;
bool l9_113;
if (l9_112)
{
l9_113=param_11.x==3;
}
else
{
l9_113=l9_112;
}
float l9_114=param_8.x;
float l9_115=param_13.x;
float l9_116=param_13.z;
bool l9_117=l9_113;
float l9_118=l9_101;
float l9_119=fast::clamp(l9_114,l9_115,l9_116);
float l9_120=step(abs(l9_114-l9_119),9.9999997e-06);
l9_118*=(l9_120+((1.0-float(l9_117))*(1.0-l9_120)));
l9_114=l9_119;
param_8.x=l9_114;
l9_101=l9_118;
bool l9_121=param_14;
bool l9_122;
if (l9_121)
{
l9_122=param_11.y==3;
}
else
{
l9_122=l9_121;
}
float l9_123=param_8.y;
float l9_124=param_13.y;
float l9_125=param_13.w;
bool l9_126=l9_122;
float l9_127=l9_101;
float l9_128=fast::clamp(l9_123,l9_124,l9_125);
float l9_129=step(abs(l9_123-l9_128),9.9999997e-06);
l9_127*=(l9_129+((1.0-float(l9_126))*(1.0-l9_129)));
l9_123=l9_128;
param_8.y=l9_123;
l9_101=l9_127;
}
float2 l9_130=param_8;
bool l9_131=param_9;
float3x3 l9_132=param_10;
if (l9_131)
{
l9_130=float2((l9_132*float3(l9_130,1.0)).xy);
}
float2 l9_133=l9_130;
float2 l9_134=l9_133;
float2 l9_135=l9_134;
param_8=l9_135;
float l9_136=param_8.x;
int l9_137=param_11.x;
bool l9_138=l9_100;
float l9_139=l9_101;
if ((l9_137==0)||(l9_137==3))
{
float l9_140=l9_136;
float l9_141=0.0;
float l9_142=1.0;
bool l9_143=l9_138;
float l9_144=l9_139;
float l9_145=fast::clamp(l9_140,l9_141,l9_142);
float l9_146=step(abs(l9_140-l9_145),9.9999997e-06);
l9_144*=(l9_146+((1.0-float(l9_143))*(1.0-l9_146)));
l9_140=l9_145;
l9_136=l9_140;
l9_139=l9_144;
}
param_8.x=l9_136;
l9_101=l9_139;
float l9_147=param_8.y;
int l9_148=param_11.y;
bool l9_149=l9_100;
float l9_150=l9_101;
if ((l9_148==0)||(l9_148==3))
{
float l9_151=l9_147;
float l9_152=0.0;
float l9_153=1.0;
bool l9_154=l9_149;
float l9_155=l9_150;
float l9_156=fast::clamp(l9_151,l9_152,l9_153);
float l9_157=step(abs(l9_151-l9_156),9.9999997e-06);
l9_155*=(l9_157+((1.0-float(l9_154))*(1.0-l9_157)));
l9_151=l9_156;
l9_147=l9_151;
l9_150=l9_155;
}
param_8.y=l9_147;
l9_101=l9_150;
float2 l9_158=param_8;
int l9_159=param_6;
int l9_160=param_7;
float l9_161=param_16;
float2 l9_162=l9_158;
int l9_163=l9_159;
int l9_164=l9_160;
float3 l9_165=float3(0.0);
if (l9_163==0)
{
l9_165=float3(l9_162,0.0);
}
else
{
if (l9_163==1)
{
l9_165=float3(l9_162.x,(l9_162.y*0.5)+(0.5-(float(l9_164)*0.5)),0.0);
}
else
{
l9_165=float3(l9_162,float(l9_164));
}
}
float3 l9_166=l9_165;
float3 l9_167=l9_166;
float2 l9_168=l9_167.xy;
float l9_169=l9_161;
float4 l9_170=sc_set0.Tweak_N168.sample(sc_set0.Tweak_N168SmpSC,l9_168,bias(l9_169));
float4 l9_171=l9_170;
float4 l9_172=l9_171;
if (param_14)
{
l9_172=mix(param_15,l9_172,float4(l9_101));
}
float4 l9_173=l9_172;
Output_N168=l9_173;
float4 Output_N169=float4(0.0);
int l9_174=0;
if ((int(Tweak_N169HasSwappedViews_tmp)!=0))
{
int l9_175=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_175=0;
}
else
{
l9_175=in.varStereoViewID;
}
int l9_176=l9_175;
l9_174=1-l9_176;
}
else
{
int l9_177=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_177=0;
}
else
{
l9_177=in.varStereoViewID;
}
int l9_178=l9_177;
l9_174=l9_178;
}
int l9_179=l9_174;
int param_17=Tweak_N169Layout_tmp;
int param_18=l9_179;
float2 param_19=Globals.Surface_UVCoord0;
bool param_20=(int(SC_USE_UV_TRANSFORM_Tweak_N169_tmp)!=0);
float3x3 param_21=(*sc_set0.UserUniforms).Tweak_N169Transform;
int2 param_22=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N169_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N169_tmp);
bool param_23=(int(SC_USE_UV_MIN_MAX_Tweak_N169_tmp)!=0);
float4 param_24=(*sc_set0.UserUniforms).Tweak_N169UvMinMax;
bool param_25=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N169_tmp)!=0);
float4 param_26=(*sc_set0.UserUniforms).Tweak_N169BorderColor;
float param_27=0.0;
bool l9_180=param_25&&(!param_23);
float l9_181=1.0;
float l9_182=param_19.x;
int l9_183=param_22.x;
if (l9_183==1)
{
l9_182=fract(l9_182);
}
else
{
if (l9_183==2)
{
float l9_184=fract(l9_182);
float l9_185=l9_182-l9_184;
float l9_186=step(0.25,fract(l9_185*0.5));
l9_182=mix(l9_184,1.0-l9_184,fast::clamp(l9_186,0.0,1.0));
}
}
param_19.x=l9_182;
float l9_187=param_19.y;
int l9_188=param_22.y;
if (l9_188==1)
{
l9_187=fract(l9_187);
}
else
{
if (l9_188==2)
{
float l9_189=fract(l9_187);
float l9_190=l9_187-l9_189;
float l9_191=step(0.25,fract(l9_190*0.5));
l9_187=mix(l9_189,1.0-l9_189,fast::clamp(l9_191,0.0,1.0));
}
}
param_19.y=l9_187;
if (param_23)
{
bool l9_192=param_25;
bool l9_193;
if (l9_192)
{
l9_193=param_22.x==3;
}
else
{
l9_193=l9_192;
}
float l9_194=param_19.x;
float l9_195=param_24.x;
float l9_196=param_24.z;
bool l9_197=l9_193;
float l9_198=l9_181;
float l9_199=fast::clamp(l9_194,l9_195,l9_196);
float l9_200=step(abs(l9_194-l9_199),9.9999997e-06);
l9_198*=(l9_200+((1.0-float(l9_197))*(1.0-l9_200)));
l9_194=l9_199;
param_19.x=l9_194;
l9_181=l9_198;
bool l9_201=param_25;
bool l9_202;
if (l9_201)
{
l9_202=param_22.y==3;
}
else
{
l9_202=l9_201;
}
float l9_203=param_19.y;
float l9_204=param_24.y;
float l9_205=param_24.w;
bool l9_206=l9_202;
float l9_207=l9_181;
float l9_208=fast::clamp(l9_203,l9_204,l9_205);
float l9_209=step(abs(l9_203-l9_208),9.9999997e-06);
l9_207*=(l9_209+((1.0-float(l9_206))*(1.0-l9_209)));
l9_203=l9_208;
param_19.y=l9_203;
l9_181=l9_207;
}
float2 l9_210=param_19;
bool l9_211=param_20;
float3x3 l9_212=param_21;
if (l9_211)
{
l9_210=float2((l9_212*float3(l9_210,1.0)).xy);
}
float2 l9_213=l9_210;
float2 l9_214=l9_213;
float2 l9_215=l9_214;
param_19=l9_215;
float l9_216=param_19.x;
int l9_217=param_22.x;
bool l9_218=l9_180;
float l9_219=l9_181;
if ((l9_217==0)||(l9_217==3))
{
float l9_220=l9_216;
float l9_221=0.0;
float l9_222=1.0;
bool l9_223=l9_218;
float l9_224=l9_219;
float l9_225=fast::clamp(l9_220,l9_221,l9_222);
float l9_226=step(abs(l9_220-l9_225),9.9999997e-06);
l9_224*=(l9_226+((1.0-float(l9_223))*(1.0-l9_226)));
l9_220=l9_225;
l9_216=l9_220;
l9_219=l9_224;
}
param_19.x=l9_216;
l9_181=l9_219;
float l9_227=param_19.y;
int l9_228=param_22.y;
bool l9_229=l9_180;
float l9_230=l9_181;
if ((l9_228==0)||(l9_228==3))
{
float l9_231=l9_227;
float l9_232=0.0;
float l9_233=1.0;
bool l9_234=l9_229;
float l9_235=l9_230;
float l9_236=fast::clamp(l9_231,l9_232,l9_233);
float l9_237=step(abs(l9_231-l9_236),9.9999997e-06);
l9_235*=(l9_237+((1.0-float(l9_234))*(1.0-l9_237)));
l9_231=l9_236;
l9_227=l9_231;
l9_230=l9_235;
}
param_19.y=l9_227;
l9_181=l9_230;
float2 l9_238=param_19;
int l9_239=param_17;
int l9_240=param_18;
float l9_241=param_27;
float2 l9_242=l9_238;
int l9_243=l9_239;
int l9_244=l9_240;
float3 l9_245=float3(0.0);
if (l9_243==0)
{
l9_245=float3(l9_242,0.0);
}
else
{
if (l9_243==1)
{
l9_245=float3(l9_242.x,(l9_242.y*0.5)+(0.5-(float(l9_244)*0.5)),0.0);
}
else
{
l9_245=float3(l9_242,float(l9_244));
}
}
float3 l9_246=l9_245;
float3 l9_247=l9_246;
float2 l9_248=l9_247.xy;
float l9_249=l9_241;
float4 l9_250=sc_set0.Tweak_N169.sample(sc_set0.Tweak_N169SmpSC,l9_248,bias(l9_249));
float4 l9_251=l9_250;
float4 l9_252=l9_251;
if (param_25)
{
l9_252=mix(param_26,l9_252,float4(l9_181));
}
float4 l9_253=l9_252;
Output_N169=l9_253;
float Value1_N170=0.0;
float Value2_N170=0.0;
float Value3_N170=0.0;
float4 param_28=Output_N169;
float param_29=param_28.x;
float param_30=param_28.y;
float param_31=param_28.z;
Value1_N170=param_29;
Value2_N170=param_30;
Value3_N170=param_31;
float4 Output_N174=float4(0.0);
float3 param_32=Output_N173.xyz;
float param_33=Output_N17;
float3 param_34=Output_N168.xyz;
float3 param_35=(*sc_set0.UserUniforms).Port_Emissive_N174;
float param_36=Value1_N170;
float param_37=Value2_N170;
float3 param_38=float3(Value3_N170);
float3 param_39=(*sc_set0.UserUniforms).Port_SpecularAO_N174;
ssGlobals param_41=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_41.BumpedNormal=float3x3(float3(param_41.VertexTangent_WorldSpace),float3(param_41.VertexBinormal_WorldSpace),float3(param_41.VertexNormal_WorldSpace))*param_34;
}
param_33=fast::clamp(param_33,0.0,1.0);
float l9_254=param_33;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_254<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_255=gl_FragCoord;
float2 l9_256=floor(mod(l9_255.xy,float2(4.0)));
float l9_257=(mod(dot(l9_256,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_254<l9_257)
{
discard_fragment();
}
}
param_32=fast::max(param_32,float3(0.0));
float4 param_40;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_40=float4(param_32,param_33);
}
else
{
param_36=fast::clamp(param_36,0.0,1.0);
param_37=fast::clamp(param_37,0.0,1.0);
param_38=fast::clamp(param_38,float3(0.0),float3(1.0));
float3 l9_258=param_32;
float l9_259=param_33;
float3 l9_260=param_41.BumpedNormal;
float3 l9_261=param_41.PositionWS;
float3 l9_262=param_41.ViewDirWS;
float3 l9_263=param_35;
float l9_264=param_36;
float l9_265=param_37;
float3 l9_266=param_38;
float3 l9_267=param_39;
SurfaceProperties l9_268;
l9_268.albedo=float3(0.0);
l9_268.opacity=1.0;
l9_268.normal=float3(0.0);
l9_268.positionWS=float3(0.0);
l9_268.viewDirWS=float3(0.0);
l9_268.metallic=0.0;
l9_268.roughness=0.0;
l9_268.emissive=float3(0.0);
l9_268.ao=float3(1.0);
l9_268.specularAo=float3(1.0);
l9_268.bakedShadows=float3(1.0);
SurfaceProperties l9_269=l9_268;
SurfaceProperties l9_270=l9_269;
l9_270.opacity=l9_259;
float3 l9_271=l9_258;
float3 l9_272;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_272=float3(pow(l9_271.x,2.2),pow(l9_271.y,2.2),pow(l9_271.z,2.2));
}
else
{
l9_272=l9_271*l9_271;
}
float3 l9_273=l9_272;
l9_270.albedo=l9_273;
l9_270.normal=normalize(l9_260);
l9_270.positionWS=l9_261;
l9_270.viewDirWS=l9_262;
float3 l9_274=l9_263;
float3 l9_275;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_275=float3(pow(l9_274.x,2.2),pow(l9_274.y,2.2),pow(l9_274.z,2.2));
}
else
{
l9_275=l9_274*l9_274;
}
float3 l9_276=l9_275;
l9_270.emissive=l9_276;
l9_270.metallic=l9_264;
l9_270.roughness=l9_265;
l9_270.ao=l9_266;
l9_270.specularAo=l9_267;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_277=l9_270.positionWS;
l9_270.ao=evaluateSSAO(l9_277,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_278=l9_270;
SurfaceProperties l9_279=l9_278;
float3 l9_280=mix(float3(0.039999999),l9_279.albedo*l9_279.metallic,float3(l9_279.metallic));
float3 l9_281=mix(l9_279.albedo*(1.0-l9_279.metallic),float3(0.0),float3(l9_279.metallic));
l9_278.albedo=l9_281;
l9_278.specColor=l9_280;
SurfaceProperties l9_282=l9_278;
l9_270=l9_282;
SurfaceProperties l9_283=l9_270;
LightingComponents l9_284;
l9_284.directDiffuse=float3(0.0);
l9_284.directSpecular=float3(0.0);
l9_284.indirectDiffuse=float3(1.0);
l9_284.indirectSpecular=float3(0.0);
l9_284.emitted=float3(0.0);
l9_284.transmitted=float3(0.0);
LightingComponents l9_285=l9_284;
LightingComponents l9_286=l9_285;
float3 l9_287=l9_283.viewDirWS;
int l9_288=0;
float4 l9_289=float4(l9_283.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_290;
LightProperties l9_291;
int l9_292=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_292<sc_DirectionalLightsCount_tmp)
{
l9_290.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_292].direction;
l9_290.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_292].color;
l9_291.direction=l9_290.direction;
l9_291.color=l9_290.color.xyz;
l9_291.attenuation=l9_290.color.w;
l9_291.attenuation*=l9_289[(l9_288<3) ? l9_288 : 3];
l9_288++;
LightingComponents l9_293=l9_286;
LightProperties l9_294=l9_291;
SurfaceProperties l9_295=l9_283;
float3 l9_296=l9_287;
SurfaceProperties l9_297=l9_295;
float3 l9_298=l9_294.direction;
float l9_299=dot(l9_297.normal,l9_298);
float l9_300=fast::clamp(l9_299,0.0,1.0);
float3 l9_301=float3(l9_300);
l9_293.directDiffuse+=((l9_301*l9_294.color)*l9_294.attenuation);
SurfaceProperties l9_302=l9_295;
float3 l9_303=l9_294.direction;
float3 l9_304=l9_296;
l9_293.directSpecular+=((calculateDirectSpecular(l9_302,l9_303,l9_304)*l9_294.color)*l9_294.attenuation);
LightingComponents l9_305=l9_293;
l9_286=l9_305;
l9_292++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_306;
LightProperties l9_307;
int l9_308=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_308<sc_PointLightsCount_tmp)
{
l9_306.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_308].falloffEnabled!=0;
l9_306.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_308].falloffEndDistance;
l9_306.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_308].negRcpFalloffEndDistance4;
l9_306.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_308].angleScale;
l9_306.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_308].angleOffset;
l9_306.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_308].direction;
l9_306.position=(*sc_set0.UserUniforms).sc_PointLights[l9_308].position;
l9_306.color=(*sc_set0.UserUniforms).sc_PointLights[l9_308].color;
float3 l9_309=l9_306.position-l9_283.positionWS;
l9_307.direction=normalize(l9_309);
l9_307.color=l9_306.color.xyz;
l9_307.attenuation=l9_306.color.w;
l9_307.attenuation*=l9_289[(l9_288<3) ? l9_288 : 3];
float3 l9_310=l9_307.direction;
float3 l9_311=l9_306.direction;
float l9_312=l9_306.angleScale;
float l9_313=l9_306.angleOffset;
float l9_314=dot(l9_310,l9_311);
float l9_315=fast::clamp((l9_314*l9_312)+l9_313,0.0,1.0);
float l9_316=l9_315*l9_315;
l9_307.attenuation*=l9_316;
if (l9_306.falloffEnabled)
{
float l9_317=length(l9_309);
float l9_318=l9_306.falloffEndDistance;
l9_307.attenuation*=computeDistanceAttenuation(l9_317,l9_318);
}
l9_288++;
LightingComponents l9_319=l9_286;
LightProperties l9_320=l9_307;
SurfaceProperties l9_321=l9_283;
float3 l9_322=l9_287;
SurfaceProperties l9_323=l9_321;
float3 l9_324=l9_320.direction;
float l9_325=dot(l9_323.normal,l9_324);
float l9_326=fast::clamp(l9_325,0.0,1.0);
float3 l9_327=float3(l9_326);
l9_319.directDiffuse+=((l9_327*l9_320.color)*l9_320.attenuation);
SurfaceProperties l9_328=l9_321;
float3 l9_329=l9_320.direction;
float3 l9_330=l9_322;
l9_319.directSpecular+=((calculateDirectSpecular(l9_328,l9_329,l9_330)*l9_320.color)*l9_320.attenuation);
LightingComponents l9_331=l9_319;
l9_286=l9_331;
l9_308++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_332=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_333=abs(in.varShadowTex-float2(0.5));
float l9_334=fast::max(l9_333.x,l9_333.y);
float l9_335=step(l9_334,0.5);
float4 l9_336=sc_set0.sc_ShadowTexture.sample(sc_set0.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_335;
float3 l9_337=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_336.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float l9_338=l9_336.w*(*sc_set0.UserUniforms).sc_ShadowDensity;
l9_332=mix(float3(1.0),l9_337,float3(l9_338));
}
else
{
l9_332=float3(1.0);
}
float3 l9_339=l9_332;
float3 l9_340=l9_339;
l9_286.directDiffuse*=l9_340;
l9_286.directSpecular*=l9_340;
}
bool l9_341=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_341)
{
float4 l9_342=gl_FragCoord;
float2 l9_343=l9_342.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_344=l9_343;
float2 l9_345=l9_344;
int l9_346=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_347=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_347=0;
}
else
{
l9_347=in.varStereoViewID;
}
int l9_348=l9_347;
l9_346=1-l9_348;
}
else
{
int l9_349=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_349=0;
}
else
{
l9_349=in.varStereoViewID;
}
int l9_350=l9_349;
l9_346=l9_350;
}
int l9_351=l9_346;
float2 l9_352=l9_345;
int l9_353=l9_351;
float2 l9_354=l9_352;
int l9_355=l9_353;
float l9_356=0.0;
float4 l9_357=float4(0.0);
float2 l9_358=l9_354;
int l9_359=sc_RayTracedShadowTextureLayout_tmp;
int l9_360=l9_355;
float l9_361=l9_356;
float2 l9_362=l9_358;
int l9_363=l9_359;
int l9_364=l9_360;
float3 l9_365=float3(0.0);
if (l9_363==0)
{
l9_365=float3(l9_362,0.0);
}
else
{
if (l9_363==1)
{
l9_365=float3(l9_362.x,(l9_362.y*0.5)+(0.5-(float(l9_364)*0.5)),0.0);
}
else
{
l9_365=float3(l9_362,float(l9_364));
}
}
float3 l9_366=l9_365;
float3 l9_367=l9_366;
float2 l9_368=l9_367.xy;
float l9_369=l9_361;
float4 l9_370=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_368,bias(l9_369));
float4 l9_371=l9_370;
l9_357=l9_371;
float4 l9_372=l9_357;
float4 l9_373=l9_372;
float4 l9_374=l9_373;
float l9_375=l9_374.x;
float3 l9_376=float3(l9_375);
float3 l9_377=l9_376;
l9_286.directDiffuse*=(float3(1.0)-l9_377);
l9_286.directSpecular*=(float3(1.0)-l9_377);
}
SurfaceProperties l9_378=l9_283;
float3 l9_379=l9_378.normal;
float3 l9_380=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_381=l9_379;
float3 l9_382=l9_381;
float l9_383=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_384=float2(0.0);
float l9_385=l9_382.x;
float l9_386=-l9_382.z;
float l9_387=(l9_385<0.0) ? (-1.0) : 1.0;
float l9_388=l9_387*acos(fast::clamp(l9_386/length(float2(l9_385,l9_386)),-1.0,1.0));
l9_384.x=l9_388-1.5707964;
l9_384.y=acos(l9_382.y);
l9_384/=float2(6.2831855,3.1415927);
l9_384.y=1.0-l9_384.y;
l9_384.x+=(l9_383/360.0);
l9_384.x=fract((l9_384.x+floor(l9_384.x))+1.0);
float2 l9_389=l9_384;
float2 l9_390=l9_389;
float4 l9_391=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_392=l9_390;
float2 l9_393=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_394=5.0;
l9_390=calcSeamlessPanoramicUvsForSampling(l9_392,l9_393,l9_394);
}
float2 l9_395=l9_390;
float l9_396=13.0;
int l9_397=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_398=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_398=0;
}
else
{
l9_398=in.varStereoViewID;
}
int l9_399=l9_398;
l9_397=1-l9_399;
}
else
{
int l9_400=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_400=0;
}
else
{
l9_400=in.varStereoViewID;
}
int l9_401=l9_400;
l9_397=l9_401;
}
int l9_402=l9_397;
float2 l9_403=l9_395;
int l9_404=l9_402;
float l9_405=l9_396;
float4 l9_406=float4(0.0);
float2 l9_407=l9_403;
int l9_408=sc_EnvmapSpecularLayout_tmp;
int l9_409=l9_404;
float l9_410=l9_405;
float2 l9_411=l9_407;
int l9_412=l9_408;
int l9_413=l9_409;
float3 l9_414=float3(0.0);
if (l9_412==0)
{
l9_414=float3(l9_411,0.0);
}
else
{
if (l9_412==1)
{
l9_414=float3(l9_411.x,(l9_411.y*0.5)+(0.5-(float(l9_413)*0.5)),0.0);
}
else
{
l9_414=float3(l9_411,float(l9_413));
}
}
float3 l9_415=l9_414;
float3 l9_416=l9_415;
float2 l9_417=l9_416.xy;
float l9_418=l9_410;
float4 l9_419=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_417,bias(l9_418));
float4 l9_420=l9_419;
l9_406=l9_420;
float4 l9_421=l9_406;
float4 l9_422=l9_421;
l9_391=l9_422;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_423=l9_390;
float2 l9_424=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_425=0.0;
l9_390=calcSeamlessPanoramicUvsForSampling(l9_423,l9_424,l9_425);
float2 l9_426=l9_390;
float l9_427=-13.0;
int l9_428=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_429=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_429=0;
}
else
{
l9_429=in.varStereoViewID;
}
int l9_430=l9_429;
l9_428=1-l9_430;
}
else
{
int l9_431=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_431=0;
}
else
{
l9_431=in.varStereoViewID;
}
int l9_432=l9_431;
l9_428=l9_432;
}
int l9_433=l9_428;
float2 l9_434=l9_426;
int l9_435=l9_433;
float l9_436=l9_427;
float4 l9_437=float4(0.0);
float2 l9_438=l9_434;
int l9_439=sc_EnvmapDiffuseLayout_tmp;
int l9_440=l9_435;
float l9_441=l9_436;
float2 l9_442=l9_438;
int l9_443=l9_439;
int l9_444=l9_440;
float3 l9_445=float3(0.0);
if (l9_443==0)
{
l9_445=float3(l9_442,0.0);
}
else
{
if (l9_443==1)
{
l9_445=float3(l9_442.x,(l9_442.y*0.5)+(0.5-(float(l9_444)*0.5)),0.0);
}
else
{
l9_445=float3(l9_442,float(l9_444));
}
}
float3 l9_446=l9_445;
float3 l9_447=l9_446;
float2 l9_448=l9_447.xy;
float l9_449=l9_441;
float4 l9_450=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_448,bias(l9_449));
float4 l9_451=l9_450;
l9_437=l9_451;
float4 l9_452=l9_437;
float4 l9_453=l9_452;
l9_391=l9_453;
}
else
{
float2 l9_454=l9_390;
float l9_455=13.0;
int l9_456=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_457=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_457=0;
}
else
{
l9_457=in.varStereoViewID;
}
int l9_458=l9_457;
l9_456=1-l9_458;
}
else
{
int l9_459=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_459=0;
}
else
{
l9_459=in.varStereoViewID;
}
int l9_460=l9_459;
l9_456=l9_460;
}
int l9_461=l9_456;
float2 l9_462=l9_454;
int l9_463=l9_461;
float l9_464=l9_455;
float4 l9_465=float4(0.0);
float2 l9_466=l9_462;
int l9_467=sc_EnvmapSpecularLayout_tmp;
int l9_468=l9_463;
float l9_469=l9_464;
float2 l9_470=l9_466;
int l9_471=l9_467;
int l9_472=l9_468;
float3 l9_473=float3(0.0);
if (l9_471==0)
{
l9_473=float3(l9_470,0.0);
}
else
{
if (l9_471==1)
{
l9_473=float3(l9_470.x,(l9_470.y*0.5)+(0.5-(float(l9_472)*0.5)),0.0);
}
else
{
l9_473=float3(l9_470,float(l9_472));
}
}
float3 l9_474=l9_473;
float3 l9_475=l9_474;
float2 l9_476=l9_475.xy;
float l9_477=l9_469;
float4 l9_478=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_476,bias(l9_477));
float4 l9_479=l9_478;
l9_465=l9_479;
float4 l9_480=l9_465;
float4 l9_481=l9_480;
l9_391=l9_481;
}
}
float4 l9_482=l9_391;
float3 l9_483=l9_482.xyz*(1.0/l9_482.w);
float3 l9_484=l9_483*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_380=l9_484;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_485=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_486=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_487=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_488=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_489=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_490=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_491=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_492=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_493=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_494=-l9_379;
float l9_495=0.0;
l9_495=l9_494.x;
float l9_496=l9_494.y;
float l9_497=l9_494.z;
float l9_498=l9_495*l9_495;
float l9_499=l9_496*l9_496;
float l9_500=l9_497*l9_497;
float l9_501=l9_495*l9_496;
float l9_502=l9_496*l9_497;
float l9_503=l9_495*l9_497;
float3 l9_504=((((((l9_493*0.42904299)*(l9_498-l9_499))+((l9_491*0.74312502)*l9_500))+(l9_485*0.88622701))-(l9_491*0.24770799))+((((l9_489*l9_501)+(l9_492*l9_503))+(l9_490*l9_502))*0.85808599))+((((l9_488*l9_495)+(l9_486*l9_496))+(l9_487*l9_497))*1.0233279);
l9_380=l9_504*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_505=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_505)
{
float4 l9_506=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_380=mix(l9_380,l9_506.xyz,float3(l9_506.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_380+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_380.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_380+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_380.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_380+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_380.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_507=l9_379;
float3 l9_508=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_509;
float l9_510;
int l9_511=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_511<sc_LightEstimationSGCount_tmp)
{
l9_509.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_511].color;
l9_509.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_511].sharpness;
l9_509.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_511].axis;
float3 l9_512=l9_507;
float l9_513=dot(l9_509.axis,l9_512);
float l9_514=l9_509.sharpness;
float l9_515=0.36000001;
float l9_516=1.0/(4.0*l9_515);
float l9_517=exp(-l9_514);
float l9_518=l9_517*l9_517;
float l9_519=1.0/l9_514;
float l9_520=(1.0+(2.0*l9_518))-l9_519;
float l9_521=((l9_517-l9_518)*l9_519)-l9_518;
float l9_522=sqrt(1.0-l9_520);
float l9_523=l9_515*l9_513;
float l9_524=l9_516*l9_522;
float l9_525=l9_523+l9_524;
float l9_526=l9_513;
float l9_527=fast::clamp(l9_526,0.0,1.0);
float l9_528=l9_527;
if (step(abs(l9_523),l9_524)>0.5)
{
l9_510=(l9_525*l9_525)/l9_522;
}
else
{
l9_510=l9_528;
}
l9_528=l9_510;
float l9_529=(l9_520*l9_528)+l9_521;
sc_SphericalGaussianLight_t l9_530=l9_509;
float3 l9_531=(l9_530.color/float3(l9_530.sharpness))*6.2831855;
float3 l9_532=(l9_531*l9_529)/float3(3.1415927);
l9_508+=l9_532;
l9_511++;
continue;
}
else
{
break;
}
}
float3 l9_533=l9_508;
l9_380+=l9_533;
}
float3 l9_534=l9_380;
float3 l9_535=l9_534;
l9_286.indirectDiffuse=l9_535;
SurfaceProperties l9_536=l9_283;
float3 l9_537=l9_287;
float3 l9_538=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_539=l9_536;
float3 l9_540=l9_537;
float3 l9_541=l9_539.normal;
float3 l9_542=reflect(-l9_540,l9_541);
float3 l9_543=l9_541;
float3 l9_544=l9_542;
float l9_545=l9_539.roughness;
l9_542=getSpecularDominantDir(l9_543,l9_544,l9_545);
float l9_546=l9_539.roughness;
float l9_547=pow(l9_546,0.66666669);
float l9_548=fast::clamp(l9_547,0.0,1.0);
float l9_549=l9_548*5.0;
float l9_550=l9_549;
float l9_551=l9_550;
float3 l9_552=l9_542;
float l9_553=l9_551;
float3 l9_554=l9_552;
float l9_555=l9_553;
float4 l9_556=float4(0.0);
float3 l9_557=l9_554;
float l9_558=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_559=float2(0.0);
float l9_560=l9_557.x;
float l9_561=-l9_557.z;
float l9_562=(l9_560<0.0) ? (-1.0) : 1.0;
float l9_563=l9_562*acos(fast::clamp(l9_561/length(float2(l9_560,l9_561)),-1.0,1.0));
l9_559.x=l9_563-1.5707964;
l9_559.y=acos(l9_557.y);
l9_559/=float2(6.2831855,3.1415927);
l9_559.y=1.0-l9_559.y;
l9_559.x+=(l9_558/360.0);
l9_559.x=fract((l9_559.x+floor(l9_559.x))+1.0);
float2 l9_564=l9_559;
float2 l9_565=l9_564;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_566=floor(l9_555);
float l9_567=ceil(l9_555);
float l9_568=l9_555-l9_566;
float2 l9_569=l9_565;
float2 l9_570=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_571=l9_566;
float2 l9_572=calcSeamlessPanoramicUvsForSampling(l9_569,l9_570,l9_571);
float2 l9_573=l9_572;
float l9_574=l9_566;
float2 l9_575=l9_573;
float l9_576=l9_574;
int l9_577=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_578=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_578=0;
}
else
{
l9_578=in.varStereoViewID;
}
int l9_579=l9_578;
l9_577=1-l9_579;
}
else
{
int l9_580=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_580=0;
}
else
{
l9_580=in.varStereoViewID;
}
int l9_581=l9_580;
l9_577=l9_581;
}
int l9_582=l9_577;
float2 l9_583=l9_575;
int l9_584=l9_582;
float l9_585=l9_576;
float4 l9_586=float4(0.0);
float2 l9_587=l9_583;
int l9_588=sc_EnvmapSpecularLayout_tmp;
int l9_589=l9_584;
float l9_590=l9_585;
float2 l9_591=l9_587;
int l9_592=l9_588;
int l9_593=l9_589;
float3 l9_594=float3(0.0);
if (l9_592==0)
{
l9_594=float3(l9_591,0.0);
}
else
{
if (l9_592==1)
{
l9_594=float3(l9_591.x,(l9_591.y*0.5)+(0.5-(float(l9_593)*0.5)),0.0);
}
else
{
l9_594=float3(l9_591,float(l9_593));
}
}
float3 l9_595=l9_594;
float3 l9_596=l9_595;
float2 l9_597=l9_596.xy;
float l9_598=l9_590;
float4 l9_599=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_597,level(l9_598));
float4 l9_600=l9_599;
l9_586=l9_600;
float4 l9_601=l9_586;
float4 l9_602=l9_601;
float4 l9_603=l9_602;
float4 l9_604=l9_603;
float2 l9_605=l9_565;
float2 l9_606=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_607=l9_567;
float2 l9_608=calcSeamlessPanoramicUvsForSampling(l9_605,l9_606,l9_607);
float2 l9_609=l9_608;
float l9_610=l9_567;
float2 l9_611=l9_609;
float l9_612=l9_610;
int l9_613=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_614=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_614=0;
}
else
{
l9_614=in.varStereoViewID;
}
int l9_615=l9_614;
l9_613=1-l9_615;
}
else
{
int l9_616=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_616=0;
}
else
{
l9_616=in.varStereoViewID;
}
int l9_617=l9_616;
l9_613=l9_617;
}
int l9_618=l9_613;
float2 l9_619=l9_611;
int l9_620=l9_618;
float l9_621=l9_612;
float4 l9_622=float4(0.0);
float2 l9_623=l9_619;
int l9_624=sc_EnvmapSpecularLayout_tmp;
int l9_625=l9_620;
float l9_626=l9_621;
float2 l9_627=l9_623;
int l9_628=l9_624;
int l9_629=l9_625;
float3 l9_630=float3(0.0);
if (l9_628==0)
{
l9_630=float3(l9_627,0.0);
}
else
{
if (l9_628==1)
{
l9_630=float3(l9_627.x,(l9_627.y*0.5)+(0.5-(float(l9_629)*0.5)),0.0);
}
else
{
l9_630=float3(l9_627,float(l9_629));
}
}
float3 l9_631=l9_630;
float3 l9_632=l9_631;
float2 l9_633=l9_632.xy;
float l9_634=l9_626;
float4 l9_635=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_633,level(l9_634));
float4 l9_636=l9_635;
l9_622=l9_636;
float4 l9_637=l9_622;
float4 l9_638=l9_637;
float4 l9_639=l9_638;
float4 l9_640=l9_639;
l9_556=mix(l9_604,l9_640,float4(l9_568));
}
else
{
float2 l9_641=l9_565;
float l9_642=l9_555;
float2 l9_643=l9_641;
float l9_644=l9_642;
int l9_645=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_646=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_646=0;
}
else
{
l9_646=in.varStereoViewID;
}
int l9_647=l9_646;
l9_645=1-l9_647;
}
else
{
int l9_648=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_648=0;
}
else
{
l9_648=in.varStereoViewID;
}
int l9_649=l9_648;
l9_645=l9_649;
}
int l9_650=l9_645;
float2 l9_651=l9_643;
int l9_652=l9_650;
float l9_653=l9_644;
float4 l9_654=float4(0.0);
float2 l9_655=l9_651;
int l9_656=sc_EnvmapSpecularLayout_tmp;
int l9_657=l9_652;
float l9_658=l9_653;
float2 l9_659=l9_655;
int l9_660=l9_656;
int l9_661=l9_657;
float3 l9_662=float3(0.0);
if (l9_660==0)
{
l9_662=float3(l9_659,0.0);
}
else
{
if (l9_660==1)
{
l9_662=float3(l9_659.x,(l9_659.y*0.5)+(0.5-(float(l9_661)*0.5)),0.0);
}
else
{
l9_662=float3(l9_659,float(l9_661));
}
}
float3 l9_663=l9_662;
float3 l9_664=l9_663;
float2 l9_665=l9_664.xy;
float l9_666=l9_658;
float4 l9_667=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_665,level(l9_666));
float4 l9_668=l9_667;
l9_654=l9_668;
float4 l9_669=l9_654;
float4 l9_670=l9_669;
float4 l9_671=l9_670;
l9_556=l9_671;
}
float4 l9_672=l9_556;
float3 l9_673=l9_672.xyz*(1.0/l9_672.w);
float3 l9_674=l9_673;
float3 l9_675=l9_674*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_675+=float3(1e-06);
float3 l9_676=l9_675;
float3 l9_677=l9_676;
bool l9_678=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_678)
{
float4 l9_679=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_677=mix(l9_677,l9_679.xyz,float3(l9_679.w));
}
SurfaceProperties l9_680=l9_539;
float l9_681=abs(dot(l9_541,l9_540));
float3 l9_682=l9_677*envBRDFApprox(l9_680,l9_681);
l9_538+=l9_682;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_683=l9_536;
float3 l9_684=l9_537;
float l9_685=fast::clamp(l9_683.roughness*l9_683.roughness,0.0099999998,1.0);
float3 l9_686=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_683.specColor;
sc_SphericalGaussianLight_t l9_687;
sc_SphericalGaussianLight_t l9_688;
sc_SphericalGaussianLight_t l9_689;
int l9_690=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_690<sc_LightEstimationSGCount_tmp)
{
l9_687.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_690].color;
l9_687.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_690].sharpness;
l9_687.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_690].axis;
float3 l9_691=l9_683.normal;
float l9_692=l9_685;
float3 l9_693=l9_684;
float3 l9_694=l9_683.specColor;
float3 l9_695=l9_691;
float l9_696=l9_692;
l9_688.axis=l9_695;
float l9_697=l9_696*l9_696;
l9_688.sharpness=2.0/l9_697;
l9_688.color=float3(1.0/(3.1415927*l9_697));
sc_SphericalGaussianLight_t l9_698=l9_688;
sc_SphericalGaussianLight_t l9_699=l9_698;
sc_SphericalGaussianLight_t l9_700=l9_699;
float3 l9_701=l9_693;
l9_689.axis=reflect(-l9_701,l9_700.axis);
l9_689.color=l9_700.color;
l9_689.sharpness=l9_700.sharpness;
l9_689.sharpness/=(4.0*fast::max(dot(l9_700.axis,l9_701),9.9999997e-05));
sc_SphericalGaussianLight_t l9_702=l9_689;
sc_SphericalGaussianLight_t l9_703=l9_702;
sc_SphericalGaussianLight_t l9_704=l9_703;
sc_SphericalGaussianLight_t l9_705=l9_687;
float l9_706=length((l9_704.axis*l9_704.sharpness)+(l9_705.axis*l9_705.sharpness));
float3 l9_707=(l9_704.color*exp((l9_706-l9_704.sharpness)-l9_705.sharpness))*l9_705.color;
float l9_708=1.0-exp((-2.0)*l9_706);
float3 l9_709=((l9_707*6.2831855)*l9_708)/float3(l9_706);
float3 l9_710=l9_709;
float3 l9_711=l9_703.axis;
float l9_712=l9_692*l9_692;
float l9_713=dot(l9_691,l9_711);
float l9_714=fast::clamp(l9_713,0.0,1.0);
float l9_715=l9_714;
float l9_716=dot(l9_691,l9_693);
float l9_717=fast::clamp(l9_716,0.0,1.0);
float l9_718=l9_717;
float3 l9_719=normalize(l9_703.axis+l9_693);
float l9_720=l9_712;
float l9_721=l9_715;
float l9_722=1.0/(l9_721+sqrt(l9_720+(((1.0-l9_720)*l9_721)*l9_721)));
float l9_723=l9_712;
float l9_724=l9_718;
float l9_725=1.0/(l9_724+sqrt(l9_723+(((1.0-l9_723)*l9_724)*l9_724)));
l9_710*=(l9_722*l9_725);
float l9_726=dot(l9_711,l9_719);
float l9_727=fast::clamp(l9_726,0.0,1.0);
float l9_728=pow(1.0-l9_727,5.0);
l9_710*=(l9_694+((float3(1.0)-l9_694)*l9_728));
l9_710*=l9_715;
float3 l9_729=l9_710;
l9_686+=l9_729;
l9_690++;
continue;
}
else
{
break;
}
}
float3 l9_730=l9_686;
l9_538+=l9_730;
}
float3 l9_731=l9_538;
l9_286.indirectSpecular=l9_731;
LightingComponents l9_732=l9_286;
LightingComponents l9_733=l9_732;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_733.directDiffuse=float3(0.0);
l9_733.indirectDiffuse=float3(0.0);
float4 l9_734=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_735=out.FragColor0;
float4 l9_736=l9_735;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_736.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_737=l9_736;
l9_734=l9_737;
}
else
{
float4 l9_738=gl_FragCoord;
float2 l9_739=l9_738.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_740=l9_739;
float2 l9_741=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_742=1;
int l9_743=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_743=0;
}
else
{
l9_743=in.varStereoViewID;
}
int l9_744=l9_743;
int l9_745=l9_744;
float3 l9_746=float3(l9_740,0.0);
int l9_747=l9_742;
int l9_748=l9_745;
if (l9_747==1)
{
l9_746.y=((2.0*l9_746.y)+float(l9_748))-1.0;
}
float2 l9_749=l9_746.xy;
l9_741=l9_749;
}
else
{
l9_741=l9_740;
}
float2 l9_750=l9_741;
float2 l9_751=l9_750;
float2 l9_752=l9_751;
int l9_753=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_754=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_754=0;
}
else
{
l9_754=in.varStereoViewID;
}
int l9_755=l9_754;
l9_753=1-l9_755;
}
else
{
int l9_756=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_756=0;
}
else
{
l9_756=in.varStereoViewID;
}
int l9_757=l9_756;
l9_753=l9_757;
}
int l9_758=l9_753;
float2 l9_759=l9_752;
int l9_760=l9_758;
float2 l9_761=l9_759;
int l9_762=l9_760;
float l9_763=0.0;
float4 l9_764=float4(0.0);
float2 l9_765=l9_761;
int l9_766=sc_ScreenTextureLayout_tmp;
int l9_767=l9_762;
float l9_768=l9_763;
float2 l9_769=l9_765;
int l9_770=l9_766;
int l9_771=l9_767;
float3 l9_772=float3(0.0);
if (l9_770==0)
{
l9_772=float3(l9_769,0.0);
}
else
{
if (l9_770==1)
{
l9_772=float3(l9_769.x,(l9_769.y*0.5)+(0.5-(float(l9_771)*0.5)),0.0);
}
else
{
l9_772=float3(l9_769,float(l9_771));
}
}
float3 l9_773=l9_772;
float3 l9_774=l9_773;
float2 l9_775=l9_774.xy;
float l9_776=l9_768;
float4 l9_777=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_775,bias(l9_776));
float4 l9_778=l9_777;
l9_764=l9_778;
float4 l9_779=l9_764;
float4 l9_780=l9_779;
float4 l9_781=l9_780;
l9_734=l9_781;
}
float4 l9_782=l9_734;
float4 l9_783=l9_782;
float3 l9_784=l9_783.xyz;
float3 l9_785;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_785=float3(pow(l9_784.x,2.2),pow(l9_784.y,2.2),pow(l9_784.z,2.2));
}
else
{
l9_785=l9_784*l9_784;
}
float3 l9_786=l9_785;
float3 l9_787=l9_786;
l9_733.transmitted=l9_787*mix(float3(1.0),l9_270.albedo,float3(l9_270.opacity));
l9_270.opacity=1.0;
}
bool l9_788=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_788=true;
}
SurfaceProperties l9_789=l9_270;
LightingComponents l9_790=l9_733;
bool l9_791=l9_788;
float3 l9_792=float3(0.0);
bool l9_793=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_793)
{
l9_792=l9_789.albedo*(l9_790.directDiffuse+(l9_790.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_792=l9_789.albedo*(l9_790.directDiffuse+(l9_790.indirectDiffuse*l9_789.ao));
}
float3 l9_794=l9_790.directSpecular+(l9_790.indirectSpecular*l9_789.specularAo);
float3 l9_795=l9_789.emissive;
float3 l9_796=l9_790.transmitted;
if (l9_791)
{
float l9_797=l9_789.opacity;
l9_792*=srgbToLinear(l9_797);
}
float3 l9_798=((l9_792+l9_794)+l9_795)+l9_796;
float3 l9_799=l9_798;
float4 l9_800=float4(l9_799,l9_270.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_801=l9_800.xyz;
float l9_802=1.8;
float l9_803=1.4;
float l9_804=0.5;
float l9_805=1.5;
float3 l9_806=(l9_801*((l9_801*l9_802)+float3(l9_803)))/((l9_801*((l9_801*l9_802)+float3(l9_804)))+float3(l9_805));
l9_800=float4(l9_806.x,l9_806.y,l9_806.z,l9_800.w);
}
float3 l9_807=l9_800.xyz;
float l9_808=l9_807.x;
float l9_809=l9_807.y;
float l9_810=l9_807.z;
float3 l9_811=float3(linearToSrgb(l9_808),linearToSrgb(l9_809),linearToSrgb(l9_810));
l9_800=float4(l9_811.x,l9_811.y,l9_811.z,l9_800.w);
float4 l9_812=l9_800;
param_40=l9_812;
}
param_40=fast::max(param_40,float4(0.0));
Output_N174=param_40;
float Output_N45=0.0;
float param_42;
if ((int(Tweak_N45_tmp)!=0))
{
param_42=1.001;
}
else
{
param_42=0.001;
}
param_42-=0.001;
Output_N45=param_42;
float4 Output_N164=float4(0.0);
Output_N164=mix(Value_N47,Output_N174,float4(Output_N45));
FinalColor=Output_N164;
float4 param_43=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_813=param_43;
float4 l9_814=l9_813;
float l9_815=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_815=l9_814.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_815=fast::clamp(l9_814.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_815=fast::clamp(dot(l9_814.xyz,float3(l9_814.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_815=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_815=(1.0-dot(l9_814.xyz,float3(0.33333001)))*l9_814.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_815=(1.0-fast::clamp(dot(l9_814.xyz,float3(1.0)),0.0,1.0))*l9_814.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_815=fast::clamp(dot(l9_814.xyz,float3(1.0)),0.0,1.0)*l9_814.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_815=fast::clamp(dot(l9_814.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_815=fast::clamp(dot(l9_814.xyz,float3(1.0)),0.0,1.0)*l9_814.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_815=dot(l9_814.xyz,float3(0.33333001))*l9_814.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_815=1.0-fast::clamp(dot(l9_814.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_815=fast::clamp(dot(l9_814.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_816=l9_815;
float l9_817=l9_816;
float l9_818=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_817;
float3 l9_819=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_813.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_820=float4(l9_819.x,l9_819.y,l9_819.z,l9_818);
param_43=l9_820;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_43=float4(param_43.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_821=param_43;
float4 l9_822=float4(0.0);
float4 l9_823=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_824=out.FragColor0;
float4 l9_825=l9_824;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_825.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_826=l9_825;
l9_823=l9_826;
}
else
{
float4 l9_827=gl_FragCoord;
float2 l9_828=l9_827.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_829=l9_828;
float2 l9_830=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_831=1;
int l9_832=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_832=0;
}
else
{
l9_832=in.varStereoViewID;
}
int l9_833=l9_832;
int l9_834=l9_833;
float3 l9_835=float3(l9_829,0.0);
int l9_836=l9_831;
int l9_837=l9_834;
if (l9_836==1)
{
l9_835.y=((2.0*l9_835.y)+float(l9_837))-1.0;
}
float2 l9_838=l9_835.xy;
l9_830=l9_838;
}
else
{
l9_830=l9_829;
}
float2 l9_839=l9_830;
float2 l9_840=l9_839;
float2 l9_841=l9_840;
int l9_842=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_843=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_843=0;
}
else
{
l9_843=in.varStereoViewID;
}
int l9_844=l9_843;
l9_842=1-l9_844;
}
else
{
int l9_845=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_845=0;
}
else
{
l9_845=in.varStereoViewID;
}
int l9_846=l9_845;
l9_842=l9_846;
}
int l9_847=l9_842;
float2 l9_848=l9_841;
int l9_849=l9_847;
float2 l9_850=l9_848;
int l9_851=l9_849;
float l9_852=0.0;
float4 l9_853=float4(0.0);
float2 l9_854=l9_850;
int l9_855=sc_ScreenTextureLayout_tmp;
int l9_856=l9_851;
float l9_857=l9_852;
float2 l9_858=l9_854;
int l9_859=l9_855;
int l9_860=l9_856;
float3 l9_861=float3(0.0);
if (l9_859==0)
{
l9_861=float3(l9_858,0.0);
}
else
{
if (l9_859==1)
{
l9_861=float3(l9_858.x,(l9_858.y*0.5)+(0.5-(float(l9_860)*0.5)),0.0);
}
else
{
l9_861=float3(l9_858,float(l9_860));
}
}
float3 l9_862=l9_861;
float3 l9_863=l9_862;
float2 l9_864=l9_863.xy;
float l9_865=l9_857;
float4 l9_866=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_864,bias(l9_865));
float4 l9_867=l9_866;
l9_853=l9_867;
float4 l9_868=l9_853;
float4 l9_869=l9_868;
float4 l9_870=l9_869;
l9_823=l9_870;
}
float4 l9_871=l9_823;
float4 l9_872=l9_871;
float3 l9_873=l9_872.xyz;
float3 l9_874=l9_873;
float3 l9_875=l9_821.xyz;
float3 l9_876=definedBlend(l9_874,l9_875,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_822=float4(l9_876.x,l9_876.y,l9_876.z,l9_822.w);
float3 l9_877=mix(l9_873,l9_822.xyz,float3(l9_821.w));
l9_822=float4(l9_877.x,l9_877.y,l9_877.z,l9_822.w);
l9_822.w=1.0;
float4 l9_878=l9_822;
param_43=l9_878;
}
else
{
float4 l9_879=param_43;
float4 l9_880=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_880=float4(mix(float3(1.0),l9_879.xyz,float3(l9_879.w)),l9_879.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_881=l9_879.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_881=fast::clamp(l9_881,0.0,1.0);
}
l9_880=float4(l9_879.xyz*l9_881,l9_881);
}
else
{
l9_880=l9_879;
}
}
float4 l9_882=l9_880;
param_43=l9_882;
}
}
}
float4 l9_883=param_43;
FinalColor=l9_883;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_884=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_884=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_884=float4(0.0);
}
float4 l9_885=l9_884;
float4 Cost=l9_885;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_44=in.varPos;
float4 param_45=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_44,param_45,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_46=FinalColor;
float4 l9_886=param_46;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_886.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_886;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 transformPosRotTexSize;
float4 transformPosRotTexDims;
float4 transformPosRotTexView;
float3x3 transformPosRotTexTransform;
float4 transformPosRotTexUvMinMax;
float4 transformPosRotTexBorderColor;
float maxInstanceCount;
float minPos;
float maxPos;
float4 transformScaleTexSize;
float4 transformScaleTexDims;
float4 transformScaleTexView;
float3x3 transformScaleTexTransform;
float4 transformScaleTexUvMinMax;
float4 transformScaleTexBorderColor;
float minSca;
float maxSca;
float Tweak_N112;
float Tweak_N110;
float Tweak_N111;
float minRot;
float maxRot;
float Tweak_N144;
float Tweak_N142;
float Tweak_N143;
float4 Tweak_N167Size;
float4 Tweak_N167Dims;
float4 Tweak_N167View;
float3x3 Tweak_N167Transform;
float4 Tweak_N167UvMinMax;
float4 Tweak_N167BorderColor;
float4 Tweak_N175;
float Tweak_N17;
float4 Tweak_N168Size;
float4 Tweak_N168Dims;
float4 Tweak_N168View;
float3x3 Tweak_N168Transform;
float4 Tweak_N168UvMinMax;
float4 Tweak_N168BorderColor;
float4 Tweak_N169Size;
float4 Tweak_N169Dims;
float4 Tweak_N169View;
float3x3 Tweak_N169Transform;
float4 Tweak_N169UvMinMax;
float4 Tweak_N169BorderColor;
float Port_Input1_N018;
float Port_Import_N125;
float Port_Import_N094;
float Port_Value2_N051;
float Port_Import_N115;
float Port_Import_N091;
float Port_Import_N116;
float Port_Import_N092;
float Port_Value2_N052;
float Port_Value2_N014;
float Port_Value4_N003;
float Port_Import_N109;
float Port_Value2_N028;
float Port_RangeMinA_N040;
float Port_RangeMaxA_N040;
float Port_Import_N119;
float Port_Import_N106;
float Port_Import_N120;
float Port_Import_N107;
float Port_Input1_N011;
float Port_Value1_N061;
float Port_Input0_N179;
float Port_Import_N127;
float Port_Import_N128;
float Port_Multiplier_N089;
float Port_Import_N130;
float Port_Import_N131;
float Port_Import_N135;
float Port_Import_N158;
float Port_Import_N140;
float3 Port_Import_N096;
float3 Port_Import_N039;
float Port_Import_N100;
float Port_Value2_N019;
float Port_Import_N121;
float Port_Import_N101;
float Port_Import_N122;
float Port_Import_N102;
float Port_Value2_N026;
float4 Port_Import_N041;
float Port_Input1_N037;
float3 Port_Import_N090;
float3 Port_Input0_N178;
float Port_Value1_N162;
float Port_Import_N146;
float Port_Import_N147;
float Port_Import_N149;
float Port_Import_N150;
float Port_Import_N154;
float Port_Value3_N162;
float3 Port_Import_N161;
float3 Port_Import_N160;
float3 Port_Import_N075;
float4 Port_Import_N076;
float Port_Input1_N083;
float3 Port_Import_N063;
float4 Port_Import_N064;
float Port_Input1_N071;
float4 Port_Default_N176;
float3 Port_Emissive_N174;
float3 Port_SpecularAO_N174;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> Tweak_N167 [[id(1)]];
texture2d<float> Tweak_N168 [[id(2)]];
texture2d<float> Tweak_N169 [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracedAoTexture [[id(15)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(16)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(17)]];
texture2d<float> sc_RayTracedShadowTexture [[id(18)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
texture2d<float> sc_ShadowTexture [[id(21)]];
texture2d<float> transformPosRotTex [[id(23)]];
texture2d<float> transformScaleTex [[id(24)]];
sampler Tweak_N167SmpSC [[id(25)]];
sampler Tweak_N168SmpSC [[id(26)]];
sampler Tweak_N169SmpSC [[id(27)]];
sampler intensityTextureSmpSC [[id(28)]];
sampler sc_EnvmapDiffuseSmpSC [[id(29)]];
sampler sc_EnvmapSpecularSmpSC [[id(30)]];
sampler sc_RayTracedAoTextureSmpSC [[id(32)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(33)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(34)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(35)]];
sampler sc_SSAOTextureSmpSC [[id(36)]];
sampler sc_ScreenTextureSmpSC [[id(37)]];
sampler sc_ShadowTextureSmpSC [[id(38)]];
sampler transformPosRotTexSmpSC [[id(40)]];
sampler transformScaleTexSmpSC [[id(41)]];
constant userUniformsObj* UserUniforms [[id(42)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
float l9_0;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
float Output_N17=0.0;
float param=(*sc_set0.UserUniforms).Tweak_N17;
Output_N17=param;
float4 Output_N168=float4(0.0);
int l9_2=0;
if ((int(Tweak_N168HasSwappedViews_tmp)!=0))
{
int l9_3=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3=0;
}
else
{
l9_3=in.varStereoViewID;
}
int l9_4=l9_3;
l9_2=1-l9_4;
}
else
{
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
l9_2=l9_6;
}
int l9_7=l9_2;
int param_1=Tweak_N168Layout_tmp;
int param_2=l9_7;
float2 param_3=Globals.Surface_UVCoord0;
bool param_4=(int(SC_USE_UV_TRANSFORM_Tweak_N168_tmp)!=0);
float3x3 param_5=(*sc_set0.UserUniforms).Tweak_N168Transform;
int2 param_6=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N168_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N168_tmp);
bool param_7=(int(SC_USE_UV_MIN_MAX_Tweak_N168_tmp)!=0);
float4 param_8=(*sc_set0.UserUniforms).Tweak_N168UvMinMax;
bool param_9=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N168_tmp)!=0);
float4 param_10=(*sc_set0.UserUniforms).Tweak_N168BorderColor;
float param_11=0.0;
bool l9_8=param_9&&(!param_7);
float l9_9=1.0;
float l9_10=param_3.x;
int l9_11=param_6.x;
if (l9_11==1)
{
l9_10=fract(l9_10);
}
else
{
if (l9_11==2)
{
float l9_12=fract(l9_10);
float l9_13=l9_10-l9_12;
float l9_14=step(0.25,fract(l9_13*0.5));
l9_10=mix(l9_12,1.0-l9_12,fast::clamp(l9_14,0.0,1.0));
}
}
param_3.x=l9_10;
float l9_15=param_3.y;
int l9_16=param_6.y;
if (l9_16==1)
{
l9_15=fract(l9_15);
}
else
{
if (l9_16==2)
{
float l9_17=fract(l9_15);
float l9_18=l9_15-l9_17;
float l9_19=step(0.25,fract(l9_18*0.5));
l9_15=mix(l9_17,1.0-l9_17,fast::clamp(l9_19,0.0,1.0));
}
}
param_3.y=l9_15;
if (param_7)
{
bool l9_20=param_9;
bool l9_21;
if (l9_20)
{
l9_21=param_6.x==3;
}
else
{
l9_21=l9_20;
}
float l9_22=param_3.x;
float l9_23=param_8.x;
float l9_24=param_8.z;
bool l9_25=l9_21;
float l9_26=l9_9;
float l9_27=fast::clamp(l9_22,l9_23,l9_24);
float l9_28=step(abs(l9_22-l9_27),9.9999997e-06);
l9_26*=(l9_28+((1.0-float(l9_25))*(1.0-l9_28)));
l9_22=l9_27;
param_3.x=l9_22;
l9_9=l9_26;
bool l9_29=param_9;
bool l9_30;
if (l9_29)
{
l9_30=param_6.y==3;
}
else
{
l9_30=l9_29;
}
float l9_31=param_3.y;
float l9_32=param_8.y;
float l9_33=param_8.w;
bool l9_34=l9_30;
float l9_35=l9_9;
float l9_36=fast::clamp(l9_31,l9_32,l9_33);
float l9_37=step(abs(l9_31-l9_36),9.9999997e-06);
l9_35*=(l9_37+((1.0-float(l9_34))*(1.0-l9_37)));
l9_31=l9_36;
param_3.y=l9_31;
l9_9=l9_35;
}
float2 l9_38=param_3;
bool l9_39=param_4;
float3x3 l9_40=param_5;
if (l9_39)
{
l9_38=float2((l9_40*float3(l9_38,1.0)).xy);
}
float2 l9_41=l9_38;
float2 l9_42=l9_41;
float2 l9_43=l9_42;
param_3=l9_43;
float l9_44=param_3.x;
int l9_45=param_6.x;
bool l9_46=l9_8;
float l9_47=l9_9;
if ((l9_45==0)||(l9_45==3))
{
float l9_48=l9_44;
float l9_49=0.0;
float l9_50=1.0;
bool l9_51=l9_46;
float l9_52=l9_47;
float l9_53=fast::clamp(l9_48,l9_49,l9_50);
float l9_54=step(abs(l9_48-l9_53),9.9999997e-06);
l9_52*=(l9_54+((1.0-float(l9_51))*(1.0-l9_54)));
l9_48=l9_53;
l9_44=l9_48;
l9_47=l9_52;
}
param_3.x=l9_44;
l9_9=l9_47;
float l9_55=param_3.y;
int l9_56=param_6.y;
bool l9_57=l9_8;
float l9_58=l9_9;
if ((l9_56==0)||(l9_56==3))
{
float l9_59=l9_55;
float l9_60=0.0;
float l9_61=1.0;
bool l9_62=l9_57;
float l9_63=l9_58;
float l9_64=fast::clamp(l9_59,l9_60,l9_61);
float l9_65=step(abs(l9_59-l9_64),9.9999997e-06);
l9_63*=(l9_65+((1.0-float(l9_62))*(1.0-l9_65)));
l9_59=l9_64;
l9_55=l9_59;
l9_58=l9_63;
}
param_3.y=l9_55;
l9_9=l9_58;
float2 l9_66=param_3;
int l9_67=param_1;
int l9_68=param_2;
float l9_69=param_11;
float2 l9_70=l9_66;
int l9_71=l9_67;
int l9_72=l9_68;
float3 l9_73=float3(0.0);
if (l9_71==0)
{
l9_73=float3(l9_70,0.0);
}
else
{
if (l9_71==1)
{
l9_73=float3(l9_70.x,(l9_70.y*0.5)+(0.5-(float(l9_72)*0.5)),0.0);
}
else
{
l9_73=float3(l9_70,float(l9_72));
}
}
float3 l9_74=l9_73;
float3 l9_75=l9_74;
float2 l9_76=l9_75.xy;
float l9_77=l9_69;
float4 l9_78=sc_set0.Tweak_N168.sample(sc_set0.Tweak_N168SmpSC,l9_76,bias(l9_77));
float4 l9_79=l9_78;
float4 l9_80=l9_79;
if (param_9)
{
l9_80=mix(param_10,l9_80,float4(l9_9));
}
float4 l9_81=l9_80;
Output_N168=l9_81;
float4 Output_N169=float4(0.0);
int l9_82=0;
if ((int(Tweak_N169HasSwappedViews_tmp)!=0))
{
int l9_83=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_83=0;
}
else
{
l9_83=in.varStereoViewID;
}
int l9_84=l9_83;
l9_82=1-l9_84;
}
else
{
int l9_85=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_85=0;
}
else
{
l9_85=in.varStereoViewID;
}
int l9_86=l9_85;
l9_82=l9_86;
}
int l9_87=l9_82;
int param_12=Tweak_N169Layout_tmp;
int param_13=l9_87;
float2 param_14=Globals.Surface_UVCoord0;
bool param_15=(int(SC_USE_UV_TRANSFORM_Tweak_N169_tmp)!=0);
float3x3 param_16=(*sc_set0.UserUniforms).Tweak_N169Transform;
int2 param_17=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N169_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N169_tmp);
bool param_18=(int(SC_USE_UV_MIN_MAX_Tweak_N169_tmp)!=0);
float4 param_19=(*sc_set0.UserUniforms).Tweak_N169UvMinMax;
bool param_20=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N169_tmp)!=0);
float4 param_21=(*sc_set0.UserUniforms).Tweak_N169BorderColor;
float param_22=0.0;
bool l9_88=param_20&&(!param_18);
float l9_89=1.0;
float l9_90=param_14.x;
int l9_91=param_17.x;
if (l9_91==1)
{
l9_90=fract(l9_90);
}
else
{
if (l9_91==2)
{
float l9_92=fract(l9_90);
float l9_93=l9_90-l9_92;
float l9_94=step(0.25,fract(l9_93*0.5));
l9_90=mix(l9_92,1.0-l9_92,fast::clamp(l9_94,0.0,1.0));
}
}
param_14.x=l9_90;
float l9_95=param_14.y;
int l9_96=param_17.y;
if (l9_96==1)
{
l9_95=fract(l9_95);
}
else
{
if (l9_96==2)
{
float l9_97=fract(l9_95);
float l9_98=l9_95-l9_97;
float l9_99=step(0.25,fract(l9_98*0.5));
l9_95=mix(l9_97,1.0-l9_97,fast::clamp(l9_99,0.0,1.0));
}
}
param_14.y=l9_95;
if (param_18)
{
bool l9_100=param_20;
bool l9_101;
if (l9_100)
{
l9_101=param_17.x==3;
}
else
{
l9_101=l9_100;
}
float l9_102=param_14.x;
float l9_103=param_19.x;
float l9_104=param_19.z;
bool l9_105=l9_101;
float l9_106=l9_89;
float l9_107=fast::clamp(l9_102,l9_103,l9_104);
float l9_108=step(abs(l9_102-l9_107),9.9999997e-06);
l9_106*=(l9_108+((1.0-float(l9_105))*(1.0-l9_108)));
l9_102=l9_107;
param_14.x=l9_102;
l9_89=l9_106;
bool l9_109=param_20;
bool l9_110;
if (l9_109)
{
l9_110=param_17.y==3;
}
else
{
l9_110=l9_109;
}
float l9_111=param_14.y;
float l9_112=param_19.y;
float l9_113=param_19.w;
bool l9_114=l9_110;
float l9_115=l9_89;
float l9_116=fast::clamp(l9_111,l9_112,l9_113);
float l9_117=step(abs(l9_111-l9_116),9.9999997e-06);
l9_115*=(l9_117+((1.0-float(l9_114))*(1.0-l9_117)));
l9_111=l9_116;
param_14.y=l9_111;
l9_89=l9_115;
}
float2 l9_118=param_14;
bool l9_119=param_15;
float3x3 l9_120=param_16;
if (l9_119)
{
l9_118=float2((l9_120*float3(l9_118,1.0)).xy);
}
float2 l9_121=l9_118;
float2 l9_122=l9_121;
float2 l9_123=l9_122;
param_14=l9_123;
float l9_124=param_14.x;
int l9_125=param_17.x;
bool l9_126=l9_88;
float l9_127=l9_89;
if ((l9_125==0)||(l9_125==3))
{
float l9_128=l9_124;
float l9_129=0.0;
float l9_130=1.0;
bool l9_131=l9_126;
float l9_132=l9_127;
float l9_133=fast::clamp(l9_128,l9_129,l9_130);
float l9_134=step(abs(l9_128-l9_133),9.9999997e-06);
l9_132*=(l9_134+((1.0-float(l9_131))*(1.0-l9_134)));
l9_128=l9_133;
l9_124=l9_128;
l9_127=l9_132;
}
param_14.x=l9_124;
l9_89=l9_127;
float l9_135=param_14.y;
int l9_136=param_17.y;
bool l9_137=l9_88;
float l9_138=l9_89;
if ((l9_136==0)||(l9_136==3))
{
float l9_139=l9_135;
float l9_140=0.0;
float l9_141=1.0;
bool l9_142=l9_137;
float l9_143=l9_138;
float l9_144=fast::clamp(l9_139,l9_140,l9_141);
float l9_145=step(abs(l9_139-l9_144),9.9999997e-06);
l9_143*=(l9_145+((1.0-float(l9_142))*(1.0-l9_145)));
l9_139=l9_144;
l9_135=l9_139;
l9_138=l9_143;
}
param_14.y=l9_135;
l9_89=l9_138;
float2 l9_146=param_14;
int l9_147=param_12;
int l9_148=param_13;
float l9_149=param_22;
float2 l9_150=l9_146;
int l9_151=l9_147;
int l9_152=l9_148;
float3 l9_153=float3(0.0);
if (l9_151==0)
{
l9_153=float3(l9_150,0.0);
}
else
{
if (l9_151==1)
{
l9_153=float3(l9_150.x,(l9_150.y*0.5)+(0.5-(float(l9_152)*0.5)),0.0);
}
else
{
l9_153=float3(l9_150,float(l9_152));
}
}
float3 l9_154=l9_153;
float3 l9_155=l9_154;
float2 l9_156=l9_155.xy;
float l9_157=l9_149;
float4 l9_158=sc_set0.Tweak_N169.sample(sc_set0.Tweak_N169SmpSC,l9_156,bias(l9_157));
float4 l9_159=l9_158;
float4 l9_160=l9_159;
if (param_20)
{
l9_160=mix(param_21,l9_160,float4(l9_89));
}
float4 l9_161=l9_160;
Output_N169=l9_161;
float Value2_N170=0.0;
float4 param_23=Output_N169;
float param_24=param_23.y;
Value2_N170=param_24;
float param_25=Output_N17;
float3 param_26=Output_N168.xyz;
float param_27=Value2_N170;
ssGlobals param_28=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_28.BumpedNormal=float3x3(float3(param_28.VertexTangent_WorldSpace),float3(param_28.VertexBinormal_WorldSpace),float3(param_28.VertexNormal_WorldSpace))*param_26;
}
param_25=fast::clamp(param_25,0.0,1.0);
float l9_162=param_25;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_162<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_163=gl_FragCoord;
float2 l9_164=floor(mod(l9_163.xy,float2(4.0)));
float l9_165=(mod(dot(l9_164,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_162<l9_165)
{
discard_fragment();
}
}
float3 l9_166=param_28.PositionWS;
float3 l9_167=param_28.BumpedNormal;
float l9_168=param_27;
float3 l9_169=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_166);
if (dot(l9_169,l9_167)>=(-0.050000001))
{
uint3 l9_170=uint3(round((l9_166-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_170.x,l9_170.y,l9_170.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_171=l9_167;
float l9_172=dot(abs(l9_171),float3(1.0));
l9_171/=float3(l9_172);
float l9_173=fast::clamp(-l9_171.z,0.0,1.0);
float2 l9_174=l9_171.xy;
float l9_175;
if (l9_171.x>=0.0)
{
l9_175=l9_173;
}
else
{
l9_175=-l9_173;
}
l9_174.x+=l9_175;
float l9_176;
if (l9_171.y>=0.0)
{
l9_176=l9_173;
}
else
{
l9_176=-l9_173;
}
l9_174.y+=l9_176;
float2 l9_177=l9_174;
float2 l9_178=l9_177;
uint2 l9_179=uint2(as_type<uint>(half2(float2(l9_178.x,0.0))),as_type<uint>(half2(float2(l9_178.y,0.0))));
out.normal_and_more=uint4(l9_179.x,l9_179.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_180;
if (l9_168<0.0)
{
l9_180=1023u;
}
else
{
l9_180=uint(fast::clamp(l9_168,0.0,1.0)*1000.0);
}
uint l9_181=l9_180;
l9_181 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_181;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
return out;
}
} // RECEIVER MODE SHADER
