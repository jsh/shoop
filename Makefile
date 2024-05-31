OBJ_DIR := ~/obj/objs
PATH := ${PWD}:${PATH}

setup: .setup

.setup:
	mkdir -p ${OBJ_DIR}/animal/dog/bigDog
	mkdir -p ${OBJ_DIR}/animal/dog/littleDog
	ln -s ${PWD}/objs/class ${OBJ_DIR}
	ln -s ${PWD}/objs/animal ${OBJ_DIR}/animal/class
	ln -s ${PWD}/objs/dog ${OBJ_DIR}/animal/dog/class
	ln -s ${PWD}/objs/bigDog ${OBJ_DIR}/animal/dog/bigDog/class
	ln -s ${PWD}/objs/littleDog ${OBJ_DIR}/animal/dog/littleDog/class
	mkdir -p ${OBJ_DIR}/hop
	ln -s ${PWD}/objs/hop ${OBJ_DIR}/hop/class
	touch .setup

simple-test: setup
	hopping | diff hopping.out -
	! ps | egrep 'new (Bunny|Seuss)'
	echo SUCCESS

animal-test: setup
	animalia | diff animalia.out -
	echo SUCCESS

test: simple-test animal-test

clean:
	rm -rf ~/obj .setup

.PHONY: clean test animal-test simple-test setup
