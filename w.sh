#!/bin/bash

I=(
    "seeking_shuriken" "smoke_shadow" "fatal_teleport" "rising_storm" "rubble_heap" "path_of_statues" "tectonic_fracture" "ore_gaze" "rumbled" "sonic_fracture" "resonance" "savage_silence" "resonating_quake" "endless_lullaby" "reactive_storm" "afterburn" "everlasting_ward" "vexing_retaliation" "guided_effigy" "fireball_frenzy" "immolated_radiance" "healing_flame"
   "purifying_flames" "exothermic" "duality" "push_and_pull" "calm_and_frenzy" "peaceful_provocation" "energy_transfer" "surging_dash" "radiant_finish" "furious_javelin" "chromatic_blade" "freeze_force" "ice_wave_impedance" "chilling_globe" "icy_avalanche" "mending_splinters" "spectrosiphon" "dread_ward" 
   "blood_forge" "blending_talons" "mach_crash" "hearty_nourishment" "catapult" "tribunal" "warding_thurible" "lasting_covenant" "balefire_surge" "blazing_pillage" "corroding_barrage" "tidal_impunity" "curative_undertow" "pilfering_swarm" "desiccation's_curse" "elemental_sandstorm" "negation_swarm" "empowered_quiver" "piercing_navigator" "infiltrate" "concentrated_arrow" "accumulating_whipclaw" "venari_bodyguard" "pilfering_strangledome" "rift_haven" "rift_torrent" "cataclysmic_continuum" "savior_decoy" "hushed_invisibility" "safeguard_switch" "irradiating_disarm" "greedy_pull" "magnetized_discharge" "counter_pulse" "fracturing_crush"
   "ballistic_bullseye" "muzzle_flash" "staggering_shield" "mesa’s_waltz" "hall_of_malevolence" "explosive_legerdemain" "total_eclipse" "pyroclastic_flow" "reaping_chakram" "safeguard" "controlled_slide" "abundant_mutation" "teeming_virulence" "larva_burst" "insatiable" "neutron_star" "antimatter_absorb" "escape_velocity" "molecular_fission" "mind_freak" "pacifying_bolts" "chaos_sphere" "assimilate"
   "smite_infusion" "hallowed_eruption" "phoenix_renewal" "hallowed_reckoning" "partitioned_mallet" "conductor" "repair_dispensary" "thrall_pact" "blinding_reave" "ironclad_charge" "iron_shrapnel" "piercing_roar" "reinforcing_stomp" "venom_sose" "revealing_spores" "regenerative_molt" "contagion_cloud" "tesla_bank" "photon_repeater" "repelling_bastille" "shock_trooper" "shocking_speed" "transistor_shield" "capacitance" "fused_resevoir" "critical_surge" "celestial_stomp" "enveloping_cloud" "primal_rage" 

)

printf "%-28s | %-12s\n" "Name" "Price"
echo "----------------------------------------"

for item in "${I[@]}"; do
    # 改用 API v2 Endpoint
    response=$(curl -s -A "Mozilla/5.0" -H "Language: zh-hant" "https://api.warframe.market/v2/orders/item/${item}")

    # v2 的 JSON 結構改從 .data 抓取
    buy=$(echo "$response" | jq '[.data[] | select(.type=="buy" and (.user.status=="ingame" or .user.status=="online")) | .platinum] | max // "無"')

    printf "%-28s | %-12s\n" "$item" "$buy"

    sleep 0.3
done
