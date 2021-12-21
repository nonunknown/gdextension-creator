

#include "LOWERC.h"

#include <godot_cpp/core/class_db.hpp>

#include <godot_cpp/classes/global_constants.hpp>
#include <godot_cpp/classes/label.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

using namespace godot;

void CNAME::_bind_methods() {
	
	// ClassDB::bind_method(D_METHOD("simple_func"), &CNAME::simple_func);

}

CNAME::CNAME() {
	UtilityFunctions::print("Constructor.");
}

CNAME::~CNAME() {
	UtilityFunctions::print("Destructor.");
}