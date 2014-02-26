# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

#BOOST LIBRARIES
include $(CLEAR_VARS)
LOCAL_MODULE:= boost_thread
LOCAL_SRC_FILES:= libs/libboost_thread-gcc-mt-1_53.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_system
LOCAL_SRC_FILES:= libs/libboost_system-gcc-mt-1_53.a
include $(PREBUILT_STATIC_LIBRARY)

#KALMAN LIBRARIES
include $(CLEAR_VARS)
LOCAL_MODULE:= kalman
LOCAL_SRC_FILES:= libs/libkalman.a
include $(PREBUILT_STATIC_LIBRARY)

#WAFFLE LIBRARIES
include $(CLEAR_VARS)
LOCAL_MODULE:= waffle
LOCAL_SRC_FILES:= libs/libwaffle.a
include $(PREBUILT_STATIC_LIBRARY)

#FUZZYLITE LIBRARIES
include $(CLEAR_VARS)
LOCAL_MODULE:= fuzzylite
LOCAL_SRC_FILES:= libs/libfuzzyLite.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE    := motiondnajava
LOCAL_SRC_FILES := src/main.cpp \
                 src/Navisens.cpp \
                 src/SerialPortDriver.cpp \
                 src/FeatureExtractor.cpp \
                 src/UsbToSpiDriver.cpp \
                 src/Adis16407Driver.cpp \
                 src/Classifier.cpp \
                 src/AltitudeEstimator.cpp \
                 src/FileHandler.cpp \
                 src/DataProtocol.cpp \
                 src/MotionEstimator.cpp \
                 src/PositionEstimatorKf.cpp \
                 src/Ahrs.cpp \
                 src/AndroidSupport.cpp \


LOCAL_LDLIBS    += -llog -landroid -lEGL -lGLESv1_CM

LOCAL_STATIC_LIBRARIES :=android_native_app_glue freeglut-gles2 boost_thread boost_system kalman waffle fuzzylite glues

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_CPPFLAGS += -fexceptions
LOCAL_CPPFLAGS += -frtti


include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)
$(call import-module,android/freeglut-gles2)
$(call import-module,android/glues)