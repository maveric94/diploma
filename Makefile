
CYCLONEOBJS = src/body.o src/collide_coarse.o src/collide_fine.o src/contacts.o src/core.o src/fgen.o src/joints.o src/particle.o src/pcontacts.o src/pfgen.o src/plinks.o src/pworld.o src/random.o src/world.o
COMMONOBJS = src/demos/app.o src/demos/main.o src/demos/timing.o

DEMOS = ballistic bigballistic blob bridge explosion fireworks flightsim fracture platform ragdoll sailboat
CXXFLAGS = -Iinclude
LDFLAGS = -framework GLUT -framework OpenGL -framework Cocoa
RM = rm -f

all:

clean:
	$(RM) $(CYCLONEOBJS) $(DEMOOBJS)
	$(RM) src/demos/*/*.o
	$(RM) src/demos/*.o
	$(RM) $(DEMOS)

$(DEMOS): $(CYCLONEOBJS) $(COMMONOBJS)
	$(CXX) $(CXXFLAGS) -c -o src/demos/$@/$@.o src/demos/$@/$@.cpp
	$(CXX) -o $@ $^ src/demos/$@/$@.o $(LDFLAGS)



