INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BatteryWidgetLabels

BatteryWidgetLabels_FILES = Tweak.x
BatteryWidgetLabels_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
