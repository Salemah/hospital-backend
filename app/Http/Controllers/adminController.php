<?php

namespace App\Http\Controllers;

use App\Http\Requests\ChangePasswordRequest;
use App\Models\Users;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class adminController extends Controller
{

    public function dashboard()
    {
        $doctors = DB::table('users')->where('type', 'doctor')->get();
        $patinents = DB::table('users')->where('type', 'patient')->get();
        $receptionists = DB::table('users')->where('type', 'receptionist')->get();

        $doctor = 0;
        $patinent = 0;
        $receptionist = 0;

        //doctor
        foreach ($doctors as $num) {
            $doctor += 1;
        }

        //patient
        foreach ($patinents as $num) {
            $patinent += 1;
        }

        //receptionist
        foreach ($receptionists as $num) {
            $receptionist += 1;
        }

        return view('admin.dashboard', compact('doctor', 'patinent', 'receptionist'));
    }

    //api
    //ALL doctor
    public function alldoctor(Request $req)
    {
        $result = Users::where('type', 'doctor')->get();

        if ($result) {
            return response()->json($result, 200);
        }
    }
    //ALL doctor
    public function Singledoctor(Request $req)
    {
        $result = Users::where('id', $req->id)->first();

        if ($result) {
            return response()->json($result, 200);
        }
    }
    //al patient
    public function allpatient(Request $req)
    {
        $result = Users::where('type', 'patient')->get();

        if ($result) {
            return response()->json($result, 200);
        }
    }
    //delet patient
    public function deletepatient(Request $req)
    {
        $result = Users::where('id', $req->id)->first();

        if ($result->delete()) {
            return response()->json(["success" => "  Delete Succesfull"], 200);
        } else {
            return response()->json(["msg" => "notfound"], 404);
        }
    }
    public function Adddoctor(Request $req)
    {

        $validator = Validator::make(
            $req->all(),

            [
                'name' => 'required|min:4|max:20',
                'username' => 'required|unique:users,username',
                'email' => 'required|email',
                'password' => 'required|min:6',
                'confirmpassword' => 'required|same:password',
                'department' => 'required',
                'dcid' => 'required|unique:users,dcid',

            ],
            [
                'username.unique' => 'Username must be   Unique',
                'confirmpassword.same' => 'password missmatched'

            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'validation_errors' => $validator->errors(),
            ]);
        } else {
            $doctor = new Users();
            $doctor->username = $req->username;
            $doctor->name = $req->name;
            $doctor->type = 'doctor';
            $doctor->email = $req->email;
            $doctor->dcid = $req->dcid;
            $doctor->department = $req->department;
            $doctor->password = $req->password;
            $doctor->save();

            if ($doctor->save()) {


                return response()->json([
                    'success' => 'Doctor Add Successful.!',
                ]);
            }
        }
    }
    //update
    public function Updatedoctor(Request $req)
    {
        $doctor = Users::where('id', $req->id)->first();
        $validator = Validator::make(
            $req->all(),

            [
                'name' => 'required',

                'email' => 'required',
                 'department' => 'required',


            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'validation_errors' => $validator->errors(),
            ]);
        } else {


            $doctor->name = $req->name;

            $doctor->email = $req->email;

            $doctor->department = $req->department;

            $doctor->update();

            if ($doctor->update()) {


                return response()->json([
                    'success' => 'Doctor  update Successful.!',
                ]);
            }
        }
    }



    //end api
    public function profile(Request $req, $id)
    {
        $user = DB::table('users')->where('id', $id)->get();
        return $user;
    }



    public function changePassword()
    {
        return view('admin.changeAdminPassword');
    }
    public function myProfile(Request $req)
    {
        $id = $req->session()->get('id');
        $profile = DB::table('users')->find($id);
        return view('admin.AdminProfile')->with('profile', $profile);
    }

    //change password
    public function changePasswordVerify(ChangePasswordRequest $req)
    {
        $id = $req->session()->get('id');
        $password = $req->session()->get('password');

        if ($req->currentPass != $password) {
            $req->session()->flash('msg', "current password doesn't match");
        } elseif ($req->newPassword != $req->retypePassword) {
            $req->session()->flash('msg', "new password and confirm password doesn't match");
        } elseif ($req->currentPass == $req->newPassword) {
            $req->session()->flash('msg', 'current password and new Password can`t be same');
        } else {
            DB::table('users')
                ->where('id', $id)
                ->update([
                    'password' => $req->newPassword,
                ]);
            $req->session()->put('password', $req->newPassword);
            $req->session()->flash('msg', 'Password changed successfully');
        }
        return redirect()->route('admin.changePassword');
    }

    //edit profile information
    public function myProfileVerify(Request $req)
    {
        $id = $req->session()->get('id');
        DB::table('users')
            ->where('id', $id)
            ->update([
                'name'       => $req->name,
                'username'   => $req->username,
                'email'      => $req->email,
                'phone'      => $req->phone,
                'bloodGroup' => $req->bloodGroup,
                'address'    => $req->location,
            ]);
        $req->session()->flash('msg', 'Your profile updated successfully');
        return redirect()->route('admin.myProfile');
    }

    //profile picture upload
    public function profilePicture(Request $req)
    {
        if ($req->has('profile')) {
            $file = $req->file('profile');
            $extention = $file->getClientOriginalExtension();
            $file_size = $file->getSize();
            $file_name = time() . "." . $extention;

            if ($extention == "png" || $extention == "jpg" || $extention == "jpge") {
                if ($file_size < 4000000) {
                    if ($file->move('upload', $file_name)) {
                        $id = $req->session()->get('id');
                        DB::table('users')
                            ->where('id', $id)
                            ->update([
                                'image' => $file_name,
                            ]);
                        $req->session()->put('image', $file_name);
                        // $req->session()->flash( 'msg', 'Profile picture uploaded successfully' );
                    } else {
                        $req->session()->flash('msg', 'Profile picture not upload');
                    }
                } else {
                    $req->session()->flash('msg', 'We allow less than 4MB file size');
                }
            } else {
                $req->session()->flash('msg', 'png,jpg,jpge file are alllow');
            }
        } else {
            $req->session()->flash('msg', 'file not found');
        }
        return redirect()->route('admin.myProfile');
    }
}
