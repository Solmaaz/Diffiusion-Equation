default: main clean

BASE = $(shell pwd)

VERSION = 0.1
# library directory

LIBS = $(BASE)/lib

#sources directory

SRC = $(BASE)/src

# include directory

INCLDS = -I$(BASE)/include/

LIB_FILE = $(LIBS)/lib.$(VERSION).a

Sources = $(shell ls $(SRC))

OBJS = $(Sources:.cpp=.o)

SRC_CMP = $(Sources:%.cpp=$(SRC)/%.cpp)

EXEFILE = $(BASE)/bin/diffiusion


MAIN_SRC= $(BASE)/main.cpp
MOBJ = main.o

print:
	@echo $(Sources)
	@echo "--------------"
	@echo $(SRC_CMP)

main: $(MOBJ) 
	@echo  "Compiling the main"
	@echo
	$(CC) $(LINK_FLAGS) $(MOBJ) $(LIB_FILE) -o $(EXEFILE)

$(MOBJ):
	$(CC) $(CFLAGS) $(INCLDS) -c $(MAIN_SRC)
	
run: 
	@echo  "Compiling the main"
	@echo
	@$(CXX) $(INCLDS) $(MAIN_SRC) $(LIB_FILE) -o diffiusion 
	@echo  "Running"
	@./diffusion
	
profile:
	@echo  "Compiling the main"
	@echo
	@$(CXX) -pg $(INCLDS) $(MAIN_SRC) $(LIB_FILE) -o diffiusion 
	@echo  "Running"
	@./diffiusion
	@gprof -b diffiusion gmon.out > Analys.txt

lib:write libclean libmake clean

write:
	@echo 
	@echo "-------------------------------------------"
	@echo 

libclean:
	@echo "Removing the old library file......."
	rm -f $(LIB_FILE)

libmake: makelib
	@echo "Making radom access to the library files ....."
	ranlib $(LIB_FILE)

makelib:compile $(OBJS)
	@echo "Making library file ....."
	ar ruv $(LIBFLAGS) $(LIB_FILE) $(OBJS)

compile:
	@echo "Compiling files for making library....."
	$(CXX) $(CFLAGS) $(INCLDS) -c $(SRC_CMP)
clean:
	@echo "Cleaning ......"
	@rm -f $(OBJS) $(MOBJ)

