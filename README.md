<https://develop.kde.org/docs/plasma/kwin/>

clone this to ~/.local/share/kwin/kwin_scripts

```bash
cd ~/.local/share/kwin
./kwin_scripts/install.sh
# etc
```

if the script appears in the output, e.g. `/Scripting/Script0` below, it means it's been enabled e.g. in window management settings.

```
$ qdbus6 org.kde.KWin | grep -i script
/Scripting
/Scripting/Script0
```

it's unknown what "run" means, as it doesn't seem to activate the script or do anything inside it, but stop seems to deactivate it

```
$ qdbus6 org.kde.KWin /Scripting/Script0
method void org.kde.kwin.Script.run()
method void org.kde.kwin.Script.stop()
signal void org.freedesktop.DBus.Properties.PropertiesChanged(QString interface_name, QVariantMap changed_properties, QStringList invalidated_properties)
method QDBusVariant org.freedesktop.DBus.Properties.Get(QString interface_name, QString property_name)
method QVariantMap org.freedesktop.DBus.Properties.GetAll(QString interface_name)
method void org.freedesktop.DBus.Properties.Set(QString interface_name, QString property_name, QDBusVariant value)
method QString org.freedesktop.DBus.Introspectable.Introspect()
method QString org.freedesktop.DBus.Peer.GetMachineId()
method void org.freedesktop.DBus.Peer.Ping()
```

deactivate the script and feedback that it's no longer present:

```
$ qdbus6 org.kde.KWin | grep -i script
/Scripting
/Scripting/Script0
$ qdbus6 org.kde.KWin /Scripting/Script0 stop
$ qdbus6 org.kde.KWin | grep -i script
/Scripting
```
