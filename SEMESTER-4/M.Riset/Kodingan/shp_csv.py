import geopandas as gpd

# Load the shapefile
shapefile_path = 'D:\Documents\SEMESTER-4\M.Riset\Kodingan\Geospasial Kab-Kota\[LapakGIS.com] Batas_Kabupaten_BIG_PPBW_V1.shp'
gdf = gpd.read_file(shapefile_path)

# # Convert the GeoDataFrame to DataFrame (this will drop geometry)
# df = gdf.drop(columns='geometry')

gdf['geometry'].apply(lambda x: x.wkt)

# Save the DataFrame to a CSV file
csv_path = 'output.csv'
gdf.to_csv(csv_path, index=False)

print(f"CSV file saved to {csv_path}")
