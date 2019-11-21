EL_FILES:=$(wildcard *.el)
ELC_TARGETS:=$(EL_FILES:.el=.elc)

.PHONY: all clean

all: $(ELC_TARGETS)

%.elc: %.el
	emacs --batch --eval '(byte-compile-file "$<")'

clean:
	$(RM) $(ELC_TARGETS)
