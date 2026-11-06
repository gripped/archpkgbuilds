# Pin Java to a supported version (17, 21 or 25), preferring the system default
for JAVA_HOME in "$(readlink -f /usr/lib/jvm/default-runtime)" \
    /usr/lib/jvm/java-25-openjdk /usr/lib/jvm/java-21-openjdk /usr/lib/jvm/java-17-openjdk; do
  case "$JAVA_HOME" in
    /usr/lib/jvm/java-17-openjdk|/usr/lib/jvm/java-21-openjdk|/usr/lib/jvm/java-25-openjdk)
      [ -x "$JAVA_HOME/bin/java" ] && break ;;
  esac
  JAVA_HOME=
done
if [ -z "$JAVA_HOME" ]; then
  echo "No supported Java runtime (17, 21 or 25) found in /usr/lib/jvm" >&2
  exit 1
fi
export JAVA_HOME JAVA="$JAVA_HOME/bin/java"
