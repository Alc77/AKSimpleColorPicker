unsigned char AKPreciseColorPickerShader_fsh[] = {
  0x70, 0x72, 0x65, 0x63, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x20, 0x68, 0x69,
  0x67, 0x68, 0x70, 0x20, 0x66, 0x6c, 0x6f, 0x61, 0x74, 0x3b, 0x0a, 0x0a,
  0x75, 0x6e, 0x69, 0x66, 0x6f, 0x72, 0x6d, 0x20, 0x76, 0x65, 0x63, 0x32,
  0x20, 0x75, 0x52, 0x65, 0x73, 0x6f, 0x6c, 0x75, 0x74, 0x69, 0x6f, 0x6e,
  0x3b, 0x0a, 0x75, 0x6e, 0x69, 0x66, 0x6f, 0x72, 0x6d, 0x20, 0x76, 0x65,
  0x63, 0x33, 0x20, 0x75, 0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6c, 0x6f,
  0x72, 0x3b, 0x0a, 0x75, 0x6e, 0x69, 0x66, 0x6f, 0x72, 0x6d, 0x20, 0x66,
  0x6c, 0x6f, 0x61, 0x74, 0x20, 0x75, 0x50, 0x69, 0x63, 0x6b, 0x65, 0x72,
  0x52, 0x61, 0x64, 0x69, 0x75, 0x73, 0x3b, 0x0a, 0x75, 0x6e, 0x69, 0x66,
  0x6f, 0x72, 0x6d, 0x20, 0x76, 0x65, 0x63, 0x32, 0x20, 0x75, 0x50, 0x69,
  0x63, 0x6b, 0x65, 0x72, 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e,
  0x3b, 0x0a, 0x0a, 0x76, 0x6f, 0x69, 0x64, 0x20, 0x6d, 0x61, 0x69, 0x6e,
  0x28, 0x76, 0x6f, 0x69, 0x64, 0x29, 0x20, 0x7b, 0x0a, 0x09, 0x76, 0x65,
  0x63, 0x32, 0x20, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x20,
  0x3d, 0x20, 0x67, 0x6c, 0x5f, 0x46, 0x72, 0x61, 0x67, 0x43, 0x6f, 0x6f,
  0x72, 0x64, 0x2e, 0x78, 0x79, 0x2f, 0x75, 0x52, 0x65, 0x73, 0x6f, 0x6c,
  0x75, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x78, 0x79, 0x3b, 0x0a, 0x09, 0x76,
  0x65, 0x63, 0x32, 0x20, 0x70, 0x69, 0x63, 0x6b, 0x65, 0x72, 0x50, 0x6f,
  0x73, 0x20, 0x3d, 0x20, 0x67, 0x6c, 0x5f, 0x46, 0x72, 0x61, 0x67, 0x43,
  0x6f, 0x6f, 0x72, 0x64, 0x2e, 0x78, 0x79, 0x20, 0x2d, 0x20, 0x75, 0x50,
  0x69, 0x63, 0x6b, 0x65, 0x72, 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f,
  0x6e, 0x2e, 0x78, 0x79, 0x3b, 0x0a, 0x09, 0x76, 0x65, 0x63, 0x34, 0x20,
  0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x3b, 0x0a, 0x09, 0x0a, 0x09, 0x66, 0x6c,
  0x6f, 0x61, 0x74, 0x20, 0x64, 0x69, 0x73, 0x74, 0x20, 0x3d, 0x20, 0x6c,
  0x65, 0x6e, 0x67, 0x74, 0x68, 0x28, 0x70, 0x69, 0x63, 0x6b, 0x65, 0x72,
  0x50, 0x6f, 0x73, 0x29, 0x3b, 0x0a, 0x09, 0x2f, 0x2f, 0x20, 0x69, 0x6e,
  0x6e, 0x65, 0x72, 0x20, 0x70, 0x61, 0x72, 0x74, 0x20, 0x6f, 0x66, 0x20,
  0x74, 0x68, 0x65, 0x20, 0x63, 0x75, 0x72, 0x73, 0x6f, 0x72, 0x0a, 0x09,
  0x69, 0x66, 0x20, 0x28, 0x64, 0x69, 0x73, 0x74, 0x20, 0x3c, 0x20, 0x30,
  0x2e, 0x36, 0x20, 0x2a, 0x20, 0x75, 0x50, 0x69, 0x63, 0x6b, 0x65, 0x72,
  0x52, 0x61, 0x64, 0x69, 0x75, 0x73, 0x20, 0x26, 0x26, 0x20, 0x64, 0x69,
  0x73, 0x74, 0x20, 0x3e, 0x20, 0x30, 0x2e, 0x32, 0x20, 0x2a, 0x20, 0x75,
  0x50, 0x69, 0x63, 0x6b, 0x65, 0x72, 0x52, 0x61, 0x64, 0x69, 0x75, 0x73,
  0x29, 0x20, 0x7b, 0x0a, 0x09, 0x09, 0x66, 0x6c, 0x6f, 0x61, 0x74, 0x20,
  0x63, 0x6f, 0x6c, 0x20, 0x3d, 0x20, 0x31, 0x2e, 0x32, 0x35, 0x20, 0x2a,
  0x20, 0x64, 0x69, 0x73, 0x74, 0x2f, 0x75, 0x50, 0x69, 0x63, 0x6b, 0x65,
  0x72, 0x52, 0x61, 0x64, 0x69, 0x75, 0x73, 0x20, 0x2d, 0x20, 0x30, 0x2e,
  0x32, 0x35, 0x3b, 0x0a, 0x09, 0x09, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x20,
  0x3d, 0x20, 0x76, 0x65, 0x63, 0x34, 0x28, 0x63, 0x6f, 0x6c, 0x2c, 0x20,
  0x63, 0x6f, 0x6c, 0x2c, 0x20, 0x63, 0x6f, 0x6c, 0x2c, 0x20, 0x31, 0x2e,
  0x30, 0x29, 0x3b, 0x0a, 0x09, 0x7d, 0x0a, 0x09, 0x2f, 0x2f, 0x20, 0x6f,
  0x75, 0x74, 0x65, 0x72, 0x20, 0x70, 0x61, 0x72, 0x74, 0x20, 0x6f, 0x66,
  0x20, 0x74, 0x68, 0x65, 0x20, 0x63, 0x75, 0x72, 0x73, 0x6f, 0x72, 0x0a,
  0x09, 0x65, 0x6c, 0x73, 0x65, 0x20, 0x69, 0x66, 0x20, 0x28, 0x64, 0x69,
  0x73, 0x74, 0x20, 0x3c, 0x20, 0x75, 0x50, 0x69, 0x63, 0x6b, 0x65, 0x72,
  0x52, 0x61, 0x64, 0x69, 0x75, 0x73, 0x20, 0x26, 0x26, 0x20, 0x64, 0x69,
  0x73, 0x74, 0x20, 0x3e, 0x3d, 0x20, 0x30, 0x2e, 0x36, 0x20, 0x2a, 0x20,
  0x75, 0x50, 0x69, 0x63, 0x6b, 0x65, 0x72, 0x52, 0x61, 0x64, 0x69, 0x75,
  0x73, 0x29, 0x20, 0x7b, 0x0a, 0x09, 0x09, 0x66, 0x6c, 0x6f, 0x61, 0x74,
  0x20, 0x63, 0x6f, 0x6c, 0x20, 0x3d, 0x20, 0x31, 0x2e, 0x32, 0x35, 0x20,
  0x2d, 0x20, 0x31, 0x2e, 0x32, 0x35, 0x20, 0x2a, 0x20, 0x64, 0x69, 0x73,
  0x74, 0x2f, 0x75, 0x50, 0x69, 0x63, 0x6b, 0x65, 0x72, 0x52, 0x61, 0x64,
  0x69, 0x75, 0x73, 0x3b, 0x0a, 0x09, 0x09, 0x63, 0x6f, 0x6c, 0x6f, 0x72,
  0x20, 0x3d, 0x20, 0x76, 0x65, 0x63, 0x34, 0x28, 0x63, 0x6f, 0x6c, 0x2c,
  0x20, 0x63, 0x6f, 0x6c, 0x2c, 0x20, 0x63, 0x6f, 0x6c, 0x2c, 0x20, 0x31,
  0x2e, 0x30, 0x29, 0x3b, 0x0a, 0x09, 0x7d, 0x0a, 0x09, 0x2f, 0x2f, 0x20,
  0x70, 0x69, 0x63, 0x6b, 0x65, 0x72, 0x20, 0x61, 0x72, 0x65, 0x61, 0x0a,
  0x09, 0x65, 0x6c, 0x73, 0x65, 0x20, 0x7b, 0x0a, 0x20, 0x20, 0x20, 0x20,
  0x20, 0x20, 0x20, 0x20, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x2e, 0x72, 0x20,
  0x3d, 0x20, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x78,
  0x20, 0x2a, 0x20, 0x28, 0x75, 0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6c,
  0x6f, 0x72, 0x2e, 0x72, 0x20, 0x2b, 0x20, 0x28, 0x31, 0x2e, 0x30, 0x20,
  0x2d, 0x20, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x79,
  0x29, 0x20, 0x2a, 0x20, 0x28, 0x31, 0x2e, 0x30, 0x20, 0x2d, 0x20, 0x75,
  0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6c, 0x6f, 0x72, 0x2e, 0x72, 0x29,
  0x29, 0x3b, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x63,
  0x6f, 0x6c, 0x6f, 0x72, 0x2e, 0x67, 0x20, 0x3d, 0x20, 0x70, 0x6f, 0x73,
  0x69, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x78, 0x20, 0x2a, 0x20, 0x28, 0x75,
  0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6c, 0x6f, 0x72, 0x2e, 0x67, 0x20,
  0x2b, 0x20, 0x28, 0x31, 0x2e, 0x30, 0x20, 0x2d, 0x20, 0x70, 0x6f, 0x73,
  0x69, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x79, 0x29, 0x20, 0x2a, 0x20, 0x28,
  0x31, 0x2e, 0x30, 0x20, 0x2d, 0x20, 0x75, 0x4d, 0x61, 0x69, 0x6e, 0x43,
  0x6f, 0x6c, 0x6f, 0x72, 0x2e, 0x67, 0x29, 0x29, 0x3b, 0x0a, 0x20, 0x20,
  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x2e,
  0x62, 0x20, 0x3d, 0x20, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e,
  0x2e, 0x78, 0x20, 0x2a, 0x20, 0x28, 0x75, 0x4d, 0x61, 0x69, 0x6e, 0x43,
  0x6f, 0x6c, 0x6f, 0x72, 0x2e, 0x62, 0x20, 0x2b, 0x20, 0x28, 0x31, 0x2e,
  0x30, 0x20, 0x2d, 0x20, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e,
  0x2e, 0x79, 0x29, 0x20, 0x2a, 0x20, 0x28, 0x31, 0x2e, 0x30, 0x20, 0x2d,
  0x20, 0x75, 0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6c, 0x6f, 0x72, 0x2e,
  0x62, 0x29, 0x29, 0x3b, 0x0a, 0x09, 0x7d, 0x09, 0x0a, 0x09, 0x67, 0x6c,
  0x5f, 0x46, 0x72, 0x61, 0x67, 0x43, 0x6f, 0x6c, 0x6f, 0x72, 0x20, 0x3d,
  0x20, 0x63, 0x6f, 0x6c, 0x6f, 0x72, 0x3b, 0x0a, 0x7d, 0x0a
};
unsigned int AKPreciseColorPickerShader_fsh_len = 994;
