## 
CC = g++
CFLAGS = -O3 -O2 -pthread -std=c++11 -g3
SRCDIR = .
OBJDIR = .
RUNDIR = .
TARGET = DengueSim
INCDIR = include
#VPATH = $(SRCDIR) $(INCDIR)
DEBUG = 0

CFLAGS := -std=c++11 -pthread 

ifeq ($(DEBUG), 1)
    CFLAGS += -Wall -ggdb
else
	ifeq ($(PERFORM), 1)
		CFLAGS += -O2 -Wall -Wno-format 
	else
		CFLAGS += -O1 -Wall -ggdb 
	endif
endif

_OBJ = main.o Simulation.o  Human.o Location.o Mosquito.o RandomNumGenerator.o Infection.o Report.o Surveillance.o Recruitment.o Vaccine.o


BIN = $(RUNDIR)/$(TARGET)

OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) -o $(BIN)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) -c $(CFLAGS) -o $@ $<

clean : 
	rm $(OBJ)
	rm $(BIN)
