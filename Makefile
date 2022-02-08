CC=gcc

SRC=src
OBJ=obj
BIN_DIR=bin
LIB=lib
TEST=test
TEST_BIN=$(TEST)/bin

LIBS=$(wildcard $(LIB)/*.h)
LIBS_SRCS=$(wildcard $(LIB)/*.c)
SRCS+=$(wildcard $(SRC)/*.c)
SRCS+=$(LIBS_SRCS)
OBJS=$(patsubst */%.c, $(OBJ)/%.o, $(SRCS))
TESTS=$(wildcard $(TEST)/*.c)
TEST_BINS=$(patsubst $(TEST)/%.c, $(TEST_BIN)/%, $(TESTS))
BIN=$(BIN_DIR)/exec

CFLAGS+=-g
CFLAGS+=-Wall
CFLAGS+=-I$(LIB)

all: $(BIN)

$(BIN): $(OBJS)
	@$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c $(LIBS)
	@$(CC) $(CFLAGS) -c $< -o $@

$(TEST_BIN)/%: $(TEST)/%.c
	@$(CC) $(CFLAGS) $< $(LIBS_SRCS) -o $@ -lcriterion

test: $(BIN) $(TEST_BIN) $(TEST_BINS)
	@for test in $(TEST_BINS) ; do ./$$test ; done

clean:
	@rm -r $(BIN_DIR)/* $(OBJ)/* $(TEST_BIN)/*