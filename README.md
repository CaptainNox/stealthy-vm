# Creating Stealthy Virtual Machines

## Modifications to the libvirt configuration file

### Windows & Linux

These modifications work for both Linux and Windows

Replace the `<os></os>` tags with:
```xml
<sysinfo type="smbios">
  <bios>
      <entry name="vendor">Lenovo</entry>
      <entry name="version">1.21</entry>
  </bios>
  <system>
    <entry name="manufacturer">Lenovo</entry>
    <entry name="product">ThinkPad X1 Carbon</entry>
    <entry name="version">11</entry>
    <entry name="serial">WZpzL8vq</entry>
  </system>
</sysinfo>
<os>
  <type arch="x86_64" machine="pc-q35-8.0">hvm</type>
  <boot dev="hd"/>
  <smbios mode="sysinfo"/>
</os>
```

Modify the CPU settings:
```xml
<cpu mode="host-model" check="none">
  <feature policy="disable" name="hypervisor"/>
</cpu>
```

Enable KVM hidden status by adding this to `features` tag:
```
<kvm>
  <hidden state="on"/>
</kvm>
```

### Linux only

**NOTE:** the following configuration **only works for SCSI disks**!

In the `devices` tag look for your disk, and add the following information:
```xml
<serial>AB1234ZEQS1321</serial>
<vendor>Samsung</vendor>
<product>500GB HDD</product>
```

## Improvements to hypervisor stealth

To achieve nearly complete stealth, implementing a custom hypervisor which is designed for stealth is necessary. Here are some resources to make that possible.

### Possible bypass by hooking CPUID instruction at hypervisor level

In order to return false information from the CPUID instruction, we need to hook it on the hypervisor level. That needs to be implemented into a hypervisor itself. We could use [SimpleVisor](https://github.com/ionescu007/SimpleVisor) as a template for this.

