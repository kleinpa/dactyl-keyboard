(ns build.main
  (:refer-clojure :exclude [use import])
  (:require [dactyl.generator :as g])
  (:gen-class))

(def config
  {:configuration-stagger-ring [0 0.0 0.0]
   :configuration-use-hotswap? false
   :configuration-thumb-middle-left-offset-x -53.0
   :configuration-rotate-x-angle 0.017453292519943295
   :configuration-tenting-angle 0.20943951023931953
   :configuration-switch-type :box
   :configuration-beta 0.08726646259971647
   :configuration-thumb-cluster-offset-y -3.0
   :configuration-thumb-top-right-offset-z -5.0
   :configuration-thumb-top-right-tenting-x 69.0
   :configuration-stagger? true
   :configuration-last-row-count :zero
   :configuration-thumb-top-right-tenting-z 69.0
   :configuration-hide-last-pinky? false
   :configuration-centercol 4
   :is-right? false
   :configuration-thumb-top-left-tenting-x 69.0
   :configuration-thumb-top-left-tenting-z 69.0
   :configuration-thumb-count :three-mini
   :configuration-thumb-top-right-offset-y -10.0
   :configuration-thumb-cluster-offset-z 7.0
   :configuration-use-external-holder? false
   :configuration-thumb-middle-left-offset-z -12.0
   :configuration-plate-projection? true
   :configuration-ncols 6
   :configuration-inner-column :normie
   :configuration-stagger-index [0 0.0 0.0]
   :configuration-thumb-middle-left-tenting-y 69.0
   :configuration-connector-type :trrs
   :configuration-thumb-top-right-offset-x -15.0
   :configuration-alpha 0.2617993877991494
   :configuration-show-caps? false
   :configuration-use-wide-pinky? false
   :configuration-stagger-pinky [0 -13.0 6.0]
   :configuration-thumb-middle-left-tenting-x 69.0
   :configuration-z-offset 4
   :configuration-stagger-middle [0 2.8 -6.5]
   :configuration-thumb-middle-left-tenting-z 69.0
   :configuration-thumb-top-left-offset-x -35.0
   :configuration-thumb-cluster-offset-x 6.0
   :configuration-wall-thickness 3.0
   :configuration-nrows 4
   :configuration-pinky-alpha 0.2617993877991494
   :configuration-web-thickness 7.0
   :configuration-thumb-top-right-tenting-y 69.0
   :configuration-use-screw-inserts? false
   :configuration-thumb-top-left-offset-y -16.0
   :configuration-use-wire-post? false
   :configuration-thumb-top-left-tenting-y 69.0
   :configuration-thumb-top-left-offset-z -2.0
   :configuration-custom-thumb-cluster? false
   :configuration-thumb-middle-left-offset-y -26.0
   :configuration-use-promicro-usb-hole? false})


(defn -main [arg]
  (print
   (case arg
     "left" (let [is-right? false] (g/generate-case-dm config is-right?))
     "right" (let [is-right? true] (g/generate-case-dm config is-right?))
     "left_plate" (let [is-right? false] (g/generate-plate-dm config is-right?))
     "right_plate" (let [is-right? true] (g/generate-plate-dm config is-right?))))
  (flush))

