#!/sbin/sh
# Touch module loader for tanzanite
# Written by @linastorvaldz on GitHub
# Last Update: 2025/11/02

# disable exit-on-error
set +e

mod_dir="/lib/modules"
mods=(
  #mtk-mbox.ko # has no depends
  switch_class.ko # has no depends
  lct_tp.ko # has no depends
  mtk-afe-external.ko # has no depends
  xiaomi.ko # has no depends
  #mtk_rpmsg_mbox.ko # depends on mtk-mbox
  #mtk_tinysys_ipi.ko # depends on mtk-mbox and mtk_rpmsg_mbox
  scp.ko # depends on mtk_tinysys_ipi , mtk-mbox, mtk-afe-external
  ft3519t.ko # finally, load the touch driver after loading its dependencies
)

# load the modules
for m in ${mods[@]}; do
  insmod $mod_dir/$m
done
