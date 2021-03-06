.SUFFIXES: .java .m

# J2OBJC Configuration
J2OBJC_DISTRIBUTION = ../build-tools/dist/j2objc-0.9.7
J2OBJC = $(J2OBJC_DISTRIBUTION)/j2objc
J2OBJCC = $(J2OBJC_DISTRIBUTION)/j2objcc
J2OBJC_ARGS = -use-arc --generate-deprecated --doc-comments -g

SOURCE_PATHS = src/main/java:../runtime/src/main/java:../runtime/src/generic/java

# Main Runtime Classes
MAIN_BUILD_DIR = build/objc/main
MAIN_SRC_DIR = ../runtime/src/main/java
MAIN_JAVA_FILES = $(shell find $(MAIN_SRC_DIR) -type f -name '*.java')
MAIN_JAVA_CLASSES = $(subst $(MAIN_SRC_DIR)/,, $(MAIN_JAVA_FILES))
MAIN_OBJC_FILES = $(addprefix $(MAIN_BUILD_DIR)/, $(MAIN_JAVA_CLASSES:.java=.m))
MAIN_OBJECTS = $(addprefix $(MAIN_BUILD_DIR)/, $(MAIN_JAVA_CLASSES:.java=.o))

# Generic Runtime Classes
GENERIC_BUILD_DIR = build/objc/generic
GENERIC_SRC_DIR = ../runtime/src/generic/java
GENERIC_JAVA_FILES = $(shell find $(GENERIC_SRC_DIR) -type f -name '*.java')
GENERIC_JAVA_CLASSES = $(subst $(GENERIC_SRC_DIR)/,, $(GENERIC_JAVA_FILES))
GENERIC_OBJC_FILES = $(addprefix $(GENERIC_BUILD_DIR)/, $(GENERIC_JAVA_CLASSES:.java=.m))
GENERIC_OBJECTS = $(addprefix $(GENERIC_BUILD_DIR)/, $(GENERIC_OBJC_FILES:.java=.o))

# Cocoa Runtime Classes
COCOA_BUILD_DIR = build/objc/cocoa
COCOA_SRC_DIR = src/main/java
COCOA_JAVA_FILES = $(shell find $(COCOA_SRC_DIR) -type f -name '*.java')
COCOA_JAVA_CLASSES = $(subst $(COCOA_SRC_DIR)/,, $(COCOA_JAVA_FILES))
COCOA_OBJC_FILES = $(addprefix $(COCOA_BUILD_DIR)/, $(COCOA_JAVA_CLASSES:.java=.m))
COCOA_OBJECTS = $(addprefix $(COCOA_BUILD_DIR)/, $(COCOA_OBJC_FILES:.java=.o))

default: translate
	@echo $(JAVA_CLASSES)
	
translate: $(MAIN_OBJC_FILES) $(GENERIC_OBJC_FILES) $(COCOA_OBJC_FILES)

$(MAIN_BUILD_DIR)/%.m: $(MAIN_SRC_DIR)/%.java
	$(J2OBJC) $(J2OBJC_ARGS) -sourcepath $(SOURCE_PATHS) -d $(MAIN_BUILD_DIR)/ $?

$(GENERIC_BUILD_DIR)/%.m: $(GENERIC_SRC_DIR)/%.java
	$(J2OBJC) $(J2OBJC_ARGS) -sourcepath $(SOURCE_PATHS) -d $(GENERIC_BUILD_DIR)/ $?

$(COCOA_BUILD_DIR)/%.m: $(COCOA_SRC_DIR)/%.java
	$(J2OBJC) $(J2OBJC_ARGS) -sourcepath $(SOURCE_PATHS) -d $(COCOA_BUILD_DIR)/ $?

# Main Classes
# MAIN_BUILD_DIR = build/objc/main
# MAIN_SRC_DIR = src/main/java
# MAIN_JAVA_FILES = $(shell find $(MAIN_SRC_DIR) -type f -name '*.java')
# MAIN_JAVA_CLASSES = $(subst $(MAIN_SRC_DIR)/,, $(MAIN_JAVA_FILES))
# MAIN_OBJC_FILES = $(addprefix $(MAIN_BUILD_DIR)/, $(MAIN_JAVA_CLASSES:.java=.m))
# MAIN_OBJECTS = $(addprefix $(MAIN_BUILD_DIR)/, $(MAIN_JAVA_CLASSES:.java=.o))

# Template Classes
# TEMPLATE_BUILD_DIR = build/objc/template
# TEMPLATE_SRC_DIR = src/template/java
# TEMPLATE_JAVA_FILES = $(shell find $(TEMPLATE_SRC_DIR) -type f -name '*.java')
# TEMPLATE_JAVA_CLASSES = $(subst $(TEMPLATE_SRC_DIR)/,, $(TEMPLATE_JAVA_FILES))
# TEMPLATE_OBJC_FILES = $(addprefix $(TEMPLATE_BUILD_DIR)/, $(TEMPLATE_JAVA_CLASSES:.java=.m))
# TEMPLATE_OBJECTS = $(addprefix $(TEMPLATE_BUILD_DIR)/, $(TEMPLATE_OBJC_FILES:.java=.o))

# default: translate
# 	@echo $(JAVA_CLASSES)

# translate: $(MAIN_OBJC_FILES) $(TEMPLATE_OBJC_FILES)

# $(MAIN_BUILD_DIR)/%.m: $(MAIN_SRC_DIR)/%.java
# 	$(J2OBJC) $(J2OBJC_ARGS) -sourcepath $(SOURCE_PATHS) -d $(MAIN_BUILD_DIR)/ $?

# $(TEMPLATE_BUILD_DIR)/%.m: $(TEMPLATE_SRC_DIR)/%.java
# 	$(J2OBJC) $(J2OBJC_ARGS) -sourcepath $(SOURCE_PATHS) -d $(TEMPLATE_BUILD_DIR)/ $?	

# $(BUILD_DIR)/%.o: $(BUILD_DIR)/%.m
	# $(J2OBJCC) -I$(BUILD_DIR) -c $? -o $@

# Compile all
# $(J2OBJCC) -o $(RESULT) $(OBJC_FILES)

#$(SOURCE_PATH)/%.java:
# 	@echo $@

# $(J2OBJC) -sourcepath $(SOURCE_PATH) -d $(BUILD_DIR) $(SOURCE_PATH)/$@
# @echo $@
# $(J2OBJC) -sourcepath $(SOURCE_PATH) -d $(BUILD_DIR) $?

# translate: $(BUILD_DIR) $(OBJC_FILES)

# default: translate $(OBJC_FILES)
#	$(J2OBJC) -o $(RESULT) $(OBJECTS)
#
# translate: $(BUILD_DIR) $(OBJC_SOURCES)
#
# clean:
#	@rm -rf $(RESULT) $(BUILD_DIR)
#
# $(BUILD_DIR)/%.m $(BUILD_DIR)/%.h: $(SOURCE_DIR)/%.java
#	$(J2OBJC) -sourcepath $(SOURCE_DIR) -d $(BUILD_DIR) $?
#
# $(BUILD_DIR)/%.o: $(BUILD_DIR)/%.m
#	$(J2OBJCC) -I$(BUILD_DIR) -c $? -o $@
#
# $(BUILD_DIR):
#	@mkdir $(BUILD_DIR)