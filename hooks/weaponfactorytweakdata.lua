--=========================--
--            AKM          --
-- GERMANTACOS, KILLERWOLF --
--=========================--

--=========================--
--        FUNCTIONS        --
--=========================--

--Pretend there are functions here

Hooks:PostHook( WeaponFactoryTweakData, "init", "AKMInit", function(self)

--=========================--
--          ARRAYS         --
--=========================--

local all_vpo209sight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local vanilla_vpo209sight = deep_clone(all_vpo209sight)
--- Barrel Extensions --
local all_vpo209ext = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_sho_ak_stamp_366_md_vpo209"
}
local all_vpo209fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}
local all_ar15stock = {
	"wpn_fps_upg_m4_s_standard",
	"wpn_fps_upg_m4_s_pts",
	"wpn_fps_upg_m4_s_crane",
	"wpn_fps_upg_m4_s_mk46",
	"wpn_fps_upg_m4_s_ubr",
	"wpn_fps_snp_tti_s_vltor"
}
--- CAFCW aka better later then never also holy shit this actually works ---
if attach_tables then
	for _, md_id in pairs(attach_tables.Barrel_Extensions) do
		if self.parts[md_id] then
			table.insert(all_vpo209ext, md_id)
		end
	end
	for _, md_id in pairs(attach_tables.Suppressors) do
		if self.parts[md_id] then
			table.insert(all_vpo209ext, md_id)
		end
	end
	for _, fl_id in pairs(attach_tables.Gadgets) do
		if self.parts[fl_id] then
			table.insert(all_vpo209fl, fl_id)
		end
	end
	for _, o_id in pairs(attach_tables.ACOG) do
		if self.parts[o_id] then
			table.insert(all_vpo209sight, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Custom) do
		if self.parts[o_id] then
			table.insert(all_vpo209sight, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Specter) do
		if self.parts[o_id] then
			table.insert(all_vpo209sight, o_id)
		end
	end
	for _, st_id in pairs(attach_tables.AR15_Stocks) do
		if self.parts[st_id] then
			table.insert(all_ar15stock, st_id)
		end
	end
	--[[
	if attach_tables.Custom_AK then --safety (since that thing doesn't exist in older versions)
		for _, o_id in pairs(attach_tables.Custom_AK) do
			if self.parts[o_id] then
				table.insert(self.parts.wpn_fps_upg_o_ak47_l_scopemount.forbids, o_id)
			end
		end
	end
	--]]
end

--=========================--
--        REQUIRES         --
--=========================--

for id, st_id in pairs (all_ar15stock) do
	self.wpn_fps_sho_ak_stamp_366.override[st_id] = {depends_on = "stock_adapter"}
	self.wpn_fps_sho_ak_stamp_366.override[st_id] = {a_obj = "a_s_ar15"}
end

--=========================--
--        	ADDS           --
--=========================--
self.parts.wpn_fps_sho_ak_stamp_366_dc_no.forbids = self.parts.wpn_fps_sho_ak_stamp_366_dc_no.forbids or {} -- STFU PAYDAY
--- Gun ---
for id, o_id in pairs(all_vpo209sight) do
	self.wpn_fps_sho_ak_stamp_366.adds[o_id] = {"wpn_fps_sho_ak_stamp_366_om_tula"}
	table.insert(self.parts.wpn_fps_sho_ak_stamp_366_dc_no.forbids, o_id)
end

-- for id, md_id in pairs(all_vpo209ext) do
	-- self.parts.wpn_fps_sho_ak_stamp_366_ba_ak104.override[md_id] = {a_obj="a_ns_ak104"}
-- end

--=========================--
--          STANCE         --
--=========================--

--- Vanilla sights ---
for id, o_id in pairs(vanilla_vpo209sight) do
	if self.parts[o_id].stance_mod.wpn_fps_ass_flint then
		self.parts[o_id].stance_mod.wpn_fps_sho_ak_stamp_366 = deep_clone(self.parts[o_id].stance_mod.wpn_fps_ass_flint)
	else
		log("[AK_Pack] [ERROR] WHO THE FUCK MESSED WITH SIGHT STANCES THIS TIME!? " .. o_id)
	end
end

--=========================--
--      COMPATIBILITY      --
--=========================--

end )