

#ifndef UPPERC_CLASS_H
#define UPPERC_CLASS_H

// We don't need windows.h in this plugin but many others do and it throws up on itself all the time
// So best to include it and make sure CI warns us when we use something Microsoft took for their own goals....
#ifdef WIN32
#include <windows.h>
#endif

#include <godot_cpp/classes/LOWEXT.hpp>
#include <godot_cpp/classes/global_constants.hpp>

#include <godot_cpp/core/binder_common.hpp>

using namespace godot;

class CNAME : public EXTENDS {
	GDCLASS(CNAME, EXTENDS);

protected:
	static void _bind_methods();

private:

public:

	CNAME();
	~CNAME();

};

#endif // ! UPPERC_CLASS_H
