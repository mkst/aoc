use std::ffi::CStr;
use std::os::raw::c_char;
use std::ptr;

extern "C" {
    fn k(t: c_char, l: u64) -> *mut u32;
}

// md5C:*"../rs/target/libaoc.so"2:`md5!1
// md5:{[x] `c md5C x}
#[no_mangle]
pub extern "C" fn md5(s: *const c_char) -> *mut u32 {
    let p;
    unsafe {
        let digest = md5::compute(CStr::from_ptr(s).to_bytes());
        p = k('I' as c_char, 16);
        for i in 0..16 {
            ptr::write(p.add(i), digest[i].into())
        }
    }
    return p
}

// ssC:*"../rs/target/release/libaoc.so"2:`ss!2
// ss:{[x;y] (),ssC[x,0x0;y,0x0]}
#[no_mangle]
pub extern "C" fn ss(h: *const c_char, n: *const c_char) -> *mut u32 {
    let p;
    unsafe {
        let hs = CStr::from_ptr(h).to_str().expect("fail");
        let ns = CStr::from_ptr(n).to_str().expect("fail");
        let v: Vec<_> = hs.match_indices(ns).collect();
        p = k('I' as c_char, v.len() as u64);
        for i in 0..v.len() {
            ptr::write(p.add(i), v[i].0 as u32)
        }
    }
    return p
}
